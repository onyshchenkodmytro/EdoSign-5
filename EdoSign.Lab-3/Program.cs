using EdoSign.Lab_3;
using EdoSign.Lab_3.Data;
using EdoSign.Lab_3.Models;
using EdoSign.Lab_3.Services;
using EdoSign.Signing;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.OpenIdConnect;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

using OpenTelemetry.Trace;
using OpenTelemetry.Resources;
using OpenTelemetry.Metrics;

using Serilog;
using Serilog.Sinks.Elasticsearch;

var builder = WebApplication.CreateBuilder(args);

// ========================================================
// 🔥 SERILOG + ELASTICSEARCH
// ========================================================
var elasticUri = "http://localhost:9200";

Log.Logger = new LoggerConfiguration()
    .Enrich.FromLogContext()
    .WriteTo.Console()
    .WriteTo.Elasticsearch(new ElasticsearchSinkOptions(new Uri(elasticUri))
    {
        AutoRegisterTemplate = true,
        IndexFormat = "edosign5-logs-{0:yyyy.MM.dd}"
    })
    .CreateLogger();

builder.Host.UseSerilog();

// ========================================================
// 🔥 DATABASE PROVIDER
// ========================================================
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

        default: // InMemory
            options.UseInMemoryDatabase("EdoSignTestDb");
            break;
    }
});

// ========================================================
// 🔥 OPEN TELEMETRY (TRACING + METRICS)
// ========================================================
var serviceName = "EdoSign5.Web";

builder.Services.AddOpenTelemetry()
    .ConfigureResource(resource => resource.AddService(serviceName))
    .WithTracing(tracing =>
    {
        tracing
            .AddAspNetCoreInstrumentation()
            .AddHttpClientInstrumentation()
            .AddSqlClientInstrumentation()
            .AddSource("EdoSign5.LongOps")
            .AddZipkinExporter(options =>
            {
                options.Endpoint = new Uri("http://localhost:9411/api/v2/spans");
            });
    })
    .WithMetrics(metrics =>
    {
        metrics
            .AddAspNetCoreInstrumentation()
            .AddRuntimeInstrumentation()
            .AddProcessInstrumentation()
            .AddPrometheusExporter();
    });

// ========================================================
// IDENTITY
// ========================================================
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

// ========================================================
// AUTHENTICATION (OIDC)
// ========================================================
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

// ========================================================
// MVC + API
// ========================================================
builder.Services.AddControllersWithViews();
builder.Services.AddControllers();

// ========================================================
// API VERSIONING
// ========================================================
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

// ========================================================
// Swagger
// ========================================================
builder.Services.AddTransient<IConfigureOptions<SwaggerGenOptions>, SwaggerConfig>();
builder.Services.AddSwaggerGen();
builder.Services.AddOpenApi();

// ========================================================
// DI
// ========================================================
builder.Services.AddSingleton<ISigner, RsaSigner>();
builder.Services.AddScoped<CryptoService>();

var app = builder.Build();

// ========================================================
// 🔥 MIGRATIONS
// ========================================================
using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<ApplicationDbContext>();
    var provider = builder.Configuration["DatabaseOptions:Provider"];

    if (provider == "SqlServer" || provider == "Postgres")
    {
        try
        {
            await db.Database.MigrateAsync();
        }
        catch (Exception ex)
        {
            Console.WriteLine("⚠ Migration failed: " + ex.Message);
        }
    }
}

// ========================================================
// STATIC FILES & ROUTING
// ========================================================
app.UseStaticFiles();
app.UseRouting();

// ========================================================
// 🔥 Prometheus /metrics — БЕЗ HTTPS-редіректу!
// ========================================================
app.UseOpenTelemetryPrometheusScrapingEndpoint();

// ========================================================
// 🔥 ONLY AFTER METRICS — HTTPS Redirection
// ========================================================
if (!app.Environment.EnvironmentName.StartsWith("Test"))
{
    app.UseHttpsRedirection();
}

app.UseAuthentication();
app.UseAuthorization();

// ========================================================
// ROUTES
// ========================================================
app.MapControllers();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}"
);

await app.RunAsync();

// ========================================================
// SwaggerConfig
// ========================================================
namespace EdoSign.Lab_3
{
    public class SwaggerConfig : IConfigureOptions<SwaggerGenOptions>
    {
        private readonly IApiVersionDescriptionProvider _provider;

        public SwaggerConfig(IApiVersionDescriptionProvider provider)
        {
            _provider = provider;
        }

        public void Configure(SwaggerGenOptions options)
        {
            foreach (var desc in _provider.ApiVersionDescriptions)
            {
                options.SwaggerDoc(desc.GroupName, new OpenApiInfo
                {
                    Title = "EdoSign API",
                    Version = desc.ApiVersion.ToString()
                });
            }
        }
    }
}


