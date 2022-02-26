using EmailService.Models;
using MailKit.Net.Smtp;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailService.Services
{
    /// <summary>
    /// Email sender.
    /// </summary>
    public class EmailSender : IEmailSender
    {
        private readonly EmailConfig _emailConfig;

        /// <summary>
        /// Ctor.
        /// </summary>
        public EmailSender(EmailConfig emailConfig)
        {
            _emailConfig = emailConfig;
        }


        /// <inheritdoc/>
        public async Task SendEmailAsync(Message message)
        {
            var emailMesasge = CreateEmailMessage(message);
            await SendAsync(emailMesasge);
        }

        private MimeMessage CreateEmailMessage(Message message)
        {
            var emailMessage = new MimeMessage();
            emailMessage.From.Add(new MailboxAddress(_emailConfig.From));
            emailMessage.To.AddRange(message.To);
            emailMessage.Subject = message.Subject;
            emailMessage.Body = message.Body;

            return emailMessage;
        }

        private async Task SendAsync(MimeMessage emailMesasge)
        {
            using (SmtpClient smtpClient = new SmtpClient())
            {
                try
                {
                    await smtpClient.ConnectAsync(_emailConfig.SmtpServer, _emailConfig.Port, true).ConfigureAwait(false);
                    smtpClient.AuthenticationMechanisms.Remove("XOAUTH2");
                    await smtpClient.AuthenticateAsync(_emailConfig.UserName, _emailConfig.Password).ConfigureAwait(false);
                    await smtpClient.SendAsync(emailMesasge).ConfigureAwait(false);
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    await smtpClient.DisconnectAsync(true).ConfigureAwait(false);
                    smtpClient.Dispose();
                }
            }
        }
    }
}
