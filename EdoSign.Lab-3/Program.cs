using EdoSign.Lab_3.Data;
using EdoSign.Lab_3.Models;
using EdoSign.Signing;
using EdoSign.Lab_3.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using Microsoft.OpenApi.Models;
using System.Security.Claims;

var builder = WebApplication.CreateBuilder(args);

// ==========================
// DATABASE
// ==========================
builder.Services.AddDbContext<ApplicationDbContext>(options =>
{
    var provider = builder.Configuration["DatabaseOptions:Provider"];

    switch (provider)
    {
        case "SqlServer":
            options.UseSqlServer(builder.Configuration.GetConnectionString("SqlServer"));
            break;
        case "Postgres":
            options.UseNpgsql(builder.Configuration.GetConnectionString("Postgres"));
            break;
        case "Sqlite":
            options.UseSqlite(builder.Configuration.GetConnectionString("Sqlite"));
            break;
        default:
            options.UseInMemoryDatabase("EdoSignVmDb");
            break;
    }
});

// ==========================
// IDENTITY (без OIDC)
// ==========================
builder.Services
    .AddIdentity<ApplicationUser, IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>()
    .AddDefaultTokenProviders();

// ==========================
// FAKE AUTH
// ==========================
builder.Services.AddAuthentication("FakeAuth")
    .AddCookie("FakeAuth");

builder.Services.AddAuthorization();

// ==========================
// MVC + API
// ==========================
builder.Services.AddControllersWithViews();
builder.Services.AddControllers();

// ==========================
// API VERSIONING
// ==========================
builder.Services.AddApiVersioning(o =>
{
    o.DefaultApiVersion = new ApiVersion(1, 0);
    o.AssumeDefaultVersionWhenUnspecified = true;
    o.ReportApiVersions = true;
});

builder.Services.AddVersionedApiExplorer(o =>
{
    o.GroupNameFormat = "'v'VVV";
    o.SubstituteApiVersionInUrl = true;
});

// ==========================
// SWAGGER
// ==========================
builder.Services.AddSwaggerGen();

builder.Services.AddSingleton<ISigner, RsaSigner>();
builder.Services.AddScoped<CryptoService>();

var app = builder.Build();

// ==========================
// AUTO MIGRATIONS (Disabled for SQLite)
// ==========================
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
            Console.WriteLine("Migration failed: " + ex.Message);
        }
    }
}

// ==========================
// FAKE LOGIN MIDDLEWARE
// ==========================
app.Use(async (context, next) =>
{
    var claims = new List<Claim>
    {
        new Claim(ClaimTypes.Name, "VmUser"),
        new Claim("role", "User"),
        new Claim(ClaimTypes.NameIdentifier, "1")
    };

    context.User = new ClaimsPrincipal(new ClaimsIdentity(claims, "FakeAuth"));

    await next();
});

// ==========================
// MIDDLEWARE PIPELINE
// ==========================
app.UseSwagger();
app.UseSwaggerUI();

app.UseStaticFiles();
app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
