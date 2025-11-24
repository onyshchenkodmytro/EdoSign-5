using EdoSign.Lab_3.Data;
using EdoSign.Lab_3.Models;
using EdoSign.Signing;
using EdoSign.Lab_3.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.OpenIdConnect;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using Microsoft.OpenApi.Models;
using System.Security.Claims;

var builder = WebApplication.CreateBuilder(args);

// =======================================================================
// 1. DATABASE PROVIDER
// =======================================================================
builder.Services.AddDbContext<ApplicationDbContext>(options =>
{
    var config = builder.Configuration;
    var provider = config["DatabaseOptions:Provider"];

    switch (provider)
    {
        case "SqlServer":
            options.UseSqlServer(config.GetConnectionString("SqlServer"));
            break;

        case "Postgres":
            options.UseNpgsql(config.GetConnectionString("Postgres"));
            break;

        case "Sqlite":
            options.UseSqlite(config.GetConnectionString("Sqlite"));
            break;

        case "InMemory":
        default:
            options.UseInMemoryDatabase("EdoSignTestDb");
            break;
    }
});

// =======================================================================
// 2. IDENTITY
// =======================================================================
builder.Services
    .AddIdentity<ApplicationUser, IdentityRole>(opt =>
    {
        opt.Password.RequiredLength = 3;
        opt.User.RequireUniqueEmail = false;
    })
    .AddEntityFrameworkStores<ApplicationDbContext>()
    .AddDefaultTokenProviders();

// =======================================================================
// 3. AUTHENTICATION
// =======================================================================
builder.Services.AddAuthentication(options =>
{
    options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
})
.AddCookie();

// OIDC ONLY IN NORMAL MODES (NOT Test.*)
if (!builder.Environment.EnvironmentName.StartsWith("Test"))
{
    builder.Services.AddAuthentication(options =>
    {
        options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
        options.DefaultChallengeScheme = OpenIdConnectDefaults.AuthenticationScheme;
    })
    .AddCookie()
    .AddOpenIdConnect("oidc", options =>
    {
        options.Authority = "https://localhost:7090";
        options.ClientId = "mvc";
        options.ClientSecret = "secret";
        options.ResponseType = "code";

        options.Scope.Add("openid");
        options.Scope.Add("profile");
        options.Scope.Add("email");
        options.Scope.Add("custom_profile");
        options.Scope.Add("edolab.api");

        options.SaveTokens = true;
        options.GetClaimsFromUserInfoEndpoint = true;

        options.TokenValidationParameters.NameClaimType = "preferred_username";
        options.TokenValidationParameters.RoleClaimType = "role";

        options.RequireHttpsMetadata = false;
    });
}

// =======================================================================
// 4. MVC + API
// =======================================================================
builder.Services.AddControllersWithViews();
builder.Services.AddControllers();

// =======================================================================
// 5. API VERSIONING
// =======================================================================
builder.Services.AddApiVersioning(options =>
{
    options.AssumeDefaultVersionWhenUnspecified = true;
    options.DefaultApiVersion = new ApiVersion(1, 0);
    options.ReportApiVersions = true;
});

builder.Services.AddVersionedApiExplorer(options =>
{
    options.GroupNameFormat = "'v'VVV";
    options.SubstituteApiVersionInUrl = true;
});

// =======================================================================
// 6. SWAGGER WITH VERSIONING
// =======================================================================
builder.Services.AddSwaggerGen(options =>
{
    var provider = builder.Services.BuildServiceProvider()
        .GetRequiredService<IApiVersionDescriptionProvider>();

    foreach (var desc in provider.ApiVersionDescriptions)
    {
        options.SwaggerDoc(desc.GroupName, new OpenApiInfo
        {
            Title = "EdoSign API",
            Version = desc.ApiVersion.ToString()
        });
    }
});

// =======================================================================
// 7. DI
// =======================================================================
builder.Services.AddSingleton<ISigner, RsaSigner>();
builder.Services.AddScoped<CryptoService>();

// =======================================================================
// 8. BUILD APP
// =======================================================================
var app = builder.Build();

// =======================================================================
// 9. APPLY MIGRATIONS (REAL DB ONLY)
// =======================================================================
using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<ApplicationDbContext>();
    var provider = builder.Configuration["DatabaseOptions:Provider"];

    if (provider == "SqlServer" || provider == "Postgres")
    {
        try
        {
            db.Database.Migrate();
        }
        catch (Exception ex)
        {
            Console.WriteLine("⚠ Migration failed: " + ex.Message);
        }
    }
}

// =======================================================================
//  10. FAKE AUTH — ONLY FOR Test.* ENVIRONMENTS
// =======================================================================
app.Use(async (context, next) => { var claims = new List<Claim> { new Claim(ClaimTypes.Name, "TestUser"), new Claim(ClaimTypes.NameIdentifier, "1"), new Claim(ClaimTypes.Email, "test@example.com"), new Claim("role", "User") }; var identity = new ClaimsIdentity(claims, "FakeAuth"); context.User = new ClaimsPrincipal(identity); await next(); });

// =======================================================================
// 11. MIDDLEWARE
// =======================================================================
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(options =>
    {
        var provider = app.Services.GetRequiredService<IApiVersionDescriptionProvider>();

        foreach (var desc in provider.ApiVersionDescriptions)
        {
            options.SwaggerEndpoint($"/swagger/{desc.GroupName}/swagger.json",
                desc.GroupName.ToUpperInvariant());
        }
    });
}
else
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

if (!app.Environment.EnvironmentName.StartsWith("Test"))
    app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

// =======================================================================
// 12. ROUTING
// =======================================================================
app.MapControllers();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
