using System.ComponentModel.DataAnnotations;

namespace HealthInCube_BackEnd.DTOs.ResetPassword
{
    /// <summary>
    /// Model for reseting password after link activation.
    /// </summary>
    public class ResetPasswordDto
    {
        [Required(ErrorMessage = "Heslo je povinné")]

        public string Password { get; set; }

        [Compare(nameof(Password), ErrorMessage = "Heslá sa nezhodujú")]
        public string ConfirmPassword { get; set; }

        public string Email { get; set; }
        public string Token { get; set; }
    }
}
