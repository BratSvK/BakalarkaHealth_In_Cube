using MimeKit;
using System.Collections.Generic;
using System.Linq;

namespace EmailService.Models
{
    /// <summary>
    /// Model for email message to be send.
    /// </summary>
    public class Message
    {
        /// <summary>
        /// Email addresses where to send email.
        /// </summary>
        public List<MailboxAddress> To { get; set; }

        /// <summary>
        /// Subject of the email message.
        /// </summary>
        public string Subject { get; set; }

        /// <summary>
        /// Body of the email message.
        /// </summary>
        public MimeEntity Body { get; set; }

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="to">To.</param>
        /// <param name="subject">Subject.</param>
        /// <param name="content">Body of the email.</param>
        public Message(IEnumerable<string> to, string subject, MimeEntity content)
        {
            To = new List<MailboxAddress>();
            To.AddRange(to.Select(x => new MailboxAddress(x)));
            Subject = subject;
            Body = content;
        }
    }
}
