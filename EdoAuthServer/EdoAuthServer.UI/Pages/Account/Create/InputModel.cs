using System.ComponentModel.DataAnnotations;

namespace EdoAuthServer.UI.Pages.Create
{
    public class InputModel
    {
        [Required]
        public string? ReturnUrl { get; set; }

        [Required]
        [StringLength(50, ErrorMessage = "Логін до 50 символів")]
        [Display(Name = "Логін")]
        public string UserName { get; set; } = default!;

        [Required]
        [StringLength(500, ErrorMessage = "ПІБ до 500 символів")]
        [Display(Name = "ПІБ (повне ім'я)")]
        public string FullName { get; set; } = default!;

        [Required]
        [StringLength(16, MinimumLength = 8, ErrorMessage = "Пароль 8-16 символів")]
        [DataType(DataType.Password)]
        [Display(Name = "Пароль")]
        public string Password { get; set; } = default!;

        [Required]
        [DataType(DataType.Password)]
        [Compare(nameof(Password), ErrorMessage = "Паролі не співпадають")]
        [Display(Name = "Підтвердження пароля")]
        public string ConfirmPassword { get; set; } = default!;

        [Required]
        [Display(Name = "Телефон")]
        [RegularExpression(@"^\+380\d{9}$", ErrorMessage = "Телефон у форматі +380XXXXXXXXX")]
        public string Phone { get; set; } = default!;

        [Required]
        [EmailAddress(ErrorMessage = "Некоректний email")]
        [Display(Name = "Email")]
        public string Email { get; set; } = default!;

        public string? Button { get; set; }
    }
}

