using EmailService.Models;
using System.Threading.Tasks;

namespace EmailService.Services
{
    /// <summary>
    /// Email sender service interface.
    /// </summary>
    public interface IEmailSender
    {
        /// <summary>
        /// Send email async.
        /// </summary>
        /// <param name="message">Message.</param>
        Task SendEmailAsync(Message message);
    }
}
