using EdoSign.Lab_3.Models;
using EdoSign.Lab_3.Models.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace EdoSign.Lab_3.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<ApplicationUser> _users;
        private readonly SignInManager<ApplicationUser> _signIn;

        public AccountController(UserManager<ApplicationUser> users, SignInManager<ApplicationUser> signIn)
        {
            _users = users;
            _signIn = signIn;
        }

        // ==========================================
        // === LOGIN (local still available) =========
        // ==========================================
        [AllowAnonymous]
        public IActionResult Login(string? returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            return View(new LoginViewModel());
        }

        [HttpPost, AllowAnonymous]
        public async Task<IActionResult> Login(LoginViewModel vm, string? returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            if (!ModelState.IsValid)
                return View(vm);

            var user = await _users.FindByNameAsync(vm.UserNameOrEmail);
            if (user == null)
            {
                ModelState.AddModelError(string.Empty, "Користувача не знайдено");
                return View(vm);
            }

            var result = await _signIn.PasswordSignInAsync(
                user.UserName,
                vm.Password,
                vm.RememberMe,
                lockoutOnFailure: false);

            if (result.Succeeded)
                return RedirectToLocal(returnUrl);

            ModelState.AddModelError("", "Невірний логін або пароль");
            return View(vm);
        }

        // ==========================================
        // === LOGOUT ===============================
        // ==========================================
        [Authorize]
        public async Task<IActionResult> Logout()
        {
            await _signIn.SignOutAsync();
            return RedirectToAction("Index", "Home");
        }

        // ==========================================
        // === PROFILE ==============================
        // ==========================================
        [Authorize]
        public async Task<IActionResult> Profile()
        {
            var user = await _users.GetUserAsync(User);
            return View(user);
        }

        // ==========================================
        // === EXTERNAL LOGIN (SSO) =================
        // ==========================================
        [HttpPost, AllowAnonymous]
        public IActionResult ExternalLogin(string provider, string? returnUrl = null)
        {
            var redirectUrl = Url.Action(nameof(ExternalLoginCallback), "Account", new { returnUrl });
            var props = _signIn.ConfigureExternalAuthenticationProperties(provider, redirectUrl);
            return Challenge(props, provider);
        }

        [AllowAnonymous]
        public async Task<IActionResult> ExternalLoginCallback(string? returnUrl = null, string? remoteError = null)
        {
            if (remoteError != null)
            {
                TempData["Error"] = $"Помилка зовнішнього входу: {remoteError}";
                return RedirectToAction(nameof(Login));
            }

            var info = await _signIn.GetExternalLoginInfoAsync();
            if (info == null)
                return RedirectToAction(nameof(Login));

            // Claims from Duende
            var userName = info.Principal.FindFirstValue("preferred_username")
                           ?? info.Principal.FindFirstValue(ClaimTypes.Name)
                           ?? info.Principal.Identity?.Name;

            if (string.IsNullOrEmpty(userName))
            {
                TempData["Error"] = "Зовнішній провайдер не повернув логін.";
                return RedirectToAction(nameof(Login));
            }

            var user = await _users.FindByNameAsync(userName);
            if (user != null)
            {
                await _signIn.SignInAsync(user, isPersistent: false);
                return RedirectToLocal(returnUrl);
            }

            TempData["Error"] = $"Користувача '{userName}' не знайдено у локальній базі.";
            return RedirectToAction(nameof(Login));
        }

        // ==========================================
        // === EXTERNAL REGISTRATION (SSO) ==========
        // ==========================================
        [HttpPost, AllowAnonymous]
        public IActionResult ExternalRegister()
        {
            var returnUrl = Url.Action("Profile", "Account");
            var url = $"https://localhost:7090/Account/Create/Index?returnUrl={Uri.EscapeDataString(returnUrl)}";
            return Redirect(url);
        }

        // ==========================================
        // === HELPERS ==============================
        // ==========================================
        private IActionResult RedirectToLocal(string? returnUrl)
        {
            if (!string.IsNullOrEmpty(returnUrl) && Url.IsLocalUrl(returnUrl))
                return Redirect(returnUrl);

            return RedirectToAction("Profile", "Account");
        }
    }
}

