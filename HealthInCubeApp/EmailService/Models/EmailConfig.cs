namespace EmailService.Models
{
    /// <summary>
    /// Email configutation.
    /// </summary>
    public class EmailConfig
    {
        /// <summary>
        /// Who is sender of email.
        /// </summary>
        public string From { get; set; }

        /// <summary>
        /// Server email machine for sending emails.
        /// </summary>
        public string SmtpServer { get; set; }

        /// <summary>
        /// Base port.
        /// </summary>
        public int Port { get; set; }

        /// <summary>
        /// User name of base gmail account.
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// Password of base gmail account.
        /// </summary>
        public string Password { get; set; }
    }
}
