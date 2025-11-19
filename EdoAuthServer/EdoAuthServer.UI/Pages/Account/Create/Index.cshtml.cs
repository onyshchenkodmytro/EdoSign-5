using Duende.IdentityServer;
using Duende.IdentityServer.Models;
using Duende.IdentityServer.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using EdoAuthServer.Models;

namespace EdoAuthServer.UI.Pages.Create
{
    [SecurityHeaders]
    [AllowAnonymous]
    public class Index : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IIdentityServerInteractionService _interaction;

        [BindProperty]
        public InputModel Input { get; set; } = default!;

        public Index(
            IIdentityServerInteractionService interaction,
            UserManager<ApplicationUser> userManager)
        {
            _interaction = interaction;
            _userManager = userManager;
        }

        public IActionResult OnGet(string? returnUrl)
        {
            Input = new InputModel { ReturnUrl = returnUrl };
            return Page();
        }

        public async Task<IActionResult> OnPost()
        {
            var context = await _interaction.GetAuthorizationContextAsync(Input.ReturnUrl);

            if (Input.Button != "create")
            {
                if (context != null)
                {
                    await _interaction.DenyAuthorizationAsync(context, AuthorizationError.AccessDenied);

                    if (context.IsNativeClient())
                        return this.LoadingPage(Input.ReturnUrl);

                    return Redirect(context.RedirectUri ?? "~/");
                }

                return Redirect("~/");
            }

            if (await _userManager.FindByNameAsync(Input.UserName) != null)
                ModelState.AddModelError("Input.UserName", "Користувач з таким логіном вже існує");

            if (await _userManager.FindByEmailAsync(Input.Email) != null)
                ModelState.AddModelError("Input.Email", "Електронна адреса вже використовується");

            if (!ModelState.IsValid)
                return Page();

            var user = new ApplicationUser
            {
                UserName = Input.UserName,
                FullName = Input.FullName,
                Email = Input.Email,
                PhoneNumber = Input.Phone,
                EmailConfirmed = true // рекомендовано для OIDC
            };

            var result = await _userManager.CreateAsync(user, Input.Password);
            if (!result.Succeeded)
            {
                foreach (var e in result.Errors)
                    ModelState.AddModelError("", e.Description);
                return Page();
            }

            // ?? LOCAL SIGN-IN
            var identityUser = new IdentityServerUser(user.Id)
            {
                DisplayName = user.FullName
            };

            await HttpContext.SignInAsync(identityUser);

            // ?? Redirect back to the client
            if (context != null)
            {
                if (context.IsNativeClient())
                    return this.LoadingPage(context.RedirectUri);

                return Redirect(context.RedirectUri);
            }

            // Fallback
            return Redirect("https://localhost:7275/");
        }


    }
}

