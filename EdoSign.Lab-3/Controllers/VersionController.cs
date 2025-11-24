using Microsoft.AspNetCore.Mvc;

namespace EdoSign.Lab_3.Controllers
{
    public class VersionController : Controller
    {
        public IActionResult Set(string v, string? returnUrl = "/")
        {
            if (v != "1.0" && v != "2.0")
                v = "1.0";

            Response.Cookies.Append(
                "ApiVersion",
                v,
                new CookieOptions
                {
                    Expires = DateTimeOffset.UtcNow.AddYears(1),
                    IsEssential = true,
                    HttpOnly = false
                });

            return Redirect(returnUrl ?? "/");
        }
    }
}
