using EdoSign.Lab_3.Data;
using EdoSign.Lab_3.Models;
using EdoSign.Signing;
using EdoSign.Lab_3.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.OpenIdConnect;

var builder = WebApplication.CreateBuilder(args);

// =======================================================
// 1. Database provider switch (SqlServer, Postgres, Sqlite, InMemory)
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
            options.UseInMemoryDatabase("EdoSignInMemory");
            break;
    }
});

// =======================================================
// 2. ASP.NET Identity
builder.Services
    .AddIdentity<ApplicationUser, IdentityRole>(opt =>
    {
        opt.Password.RequiredLength = 8;
        opt.Password.RequireDigit = true;
        opt.Password.RequireNonAlphanumeric = true;
        opt.Password.RequireUppercase = true;
        opt.Password.RequireLowercase = false;
        opt.Password.RequiredUniqueChars = 1;
        opt.User.RequireUniqueEmail = true;
    })
    .AddEntityFrameworkStores<ApplicationDbContext>()
    .AddDefaultTokenProviders();

// =======================================================
// 3. OpenID Connect (EdoAuthServer)
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

// =======================================================
// 4. MVC
builder.Services.AddControllersWithViews();

// =======================================================
// 5. Authorization
builder.Services.AddAuthorization();

// =======================================================
// 6. DI
builder.Services.AddSingleton<ISigner, RsaSigner>();
builder.Services.AddScoped<CryptoService>();

// =======================================================
// 7. Build app
var app = builder.Build();

// =======================================================
// 8. Auto-migration: create DB and apply migrations
using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<ApplicationDbContext>();

    try
    {
        db.Database.Migrate();
    }
    catch (Exception ex)
    {
        Console.WriteLine("⚠️ Migration failed: " + ex.Message);
    }
}

// =======================================================
// 9. Middleware
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();

