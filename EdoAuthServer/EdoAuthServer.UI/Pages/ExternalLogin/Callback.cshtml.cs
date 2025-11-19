// Copyright (c)
// Modified for ASP.NET Identity integration

using Duende.IdentityServer;
using Duende.IdentityServer.Events;
using Duende.IdentityServer.Models;
using Duende.IdentityServer.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using EdoAuthServer.Models;
using System.Security.Claims;

namespace EdoAuthServer.UI.Pages.ExternalLogin
{
    [SecurityHeaders]
    [AllowAnonymous]
    public class Callback : PageModel
    {
        private readonly IIdentityServerInteractionService _interaction;
        private readonly IEventService _events;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly UserManager<ApplicationUser> _userManager;

        public Callback(
            IIdentityServerInteractionService interaction,
            IEventService events,
            SignInManager<ApplicationUser> signInManager,
            UserManager<ApplicationUser> userManager)
        {
            _interaction = interaction;
            _events = events;
            _signInManager = signInManager;
            _userManager = userManager;
        }

        public async Task<IActionResult> OnGet()
        {
            // read external identity info
            var result = await HttpContext.AuthenticateAsync(IdentityServerConstants.ExternalCookieAuthenticationScheme);
            if (result?.Succeeded != true)
                throw new Exception("External authentication failed");

            var externalUser = result.Principal;
            var externalUserId = externalUser.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            // Try find existing user or create new
            var email = externalUser.FindFirst(ClaimTypes.Email)?.Value;
            var username = externalUser.Identity?.Name ?? email;

            var user = await _userManager.FindByNameAsync(username);
            if (user == null)
            {
                user = new ApplicationUser
                {
                    UserName = username,
                    Email = email,
                    FullName = externalUser.FindFirst("name")?.Value ?? username
                };

                await _userManager.CreateAsync(user);
            }

            await _signInManager.SignInAsync(user, isPersistent: false);

            await HttpContext.SignOutAsync(IdentityServerConstants.ExternalCookieAuthenticationScheme);

            var returnUrl = result.Properties.Items["returnUrl"] ?? "~/";
            var context = await _interaction.GetAuthorizationContextAsync(returnUrl);

            if (context != null)
            {
                return Redirect(returnUrl);
            }

            return Redirect("~/");
        }
    }
}
