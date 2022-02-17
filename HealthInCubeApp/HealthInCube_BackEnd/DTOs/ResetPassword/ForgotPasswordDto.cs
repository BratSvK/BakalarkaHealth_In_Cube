using System.ComponentModel.DataAnnotations;

namespace HealthInCube_BackEnd.DTOs.ResetPassword
{
    /// <summary>
    /// Forgot password model.
    /// </summary>
    public class ForgotPasswordDto
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }

        /// <summary>
        /// Uri of client.
        /// </summary>
        [Required]
        public string ClientURI { get; set; }
    }
}
