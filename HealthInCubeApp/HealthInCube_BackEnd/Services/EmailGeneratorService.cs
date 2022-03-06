using EmailService.Models;
using EmailService.Services;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Extensions;
using HealthInCube_BackEnd.Interfaces;
using HealthInCube_BackEnd.Properties;
using MimeKit;
using MimeKit.Utils;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Services
{
    /// <inheritdoc/>
    public class EmailGeneratorService : IEmailGeneratorService
    {
        private readonly IEmailSender _emailSenderService;
        private readonly BodyBuilder _bodyBuilder;


        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="emailSenderService">Service for sending emails.</param>
        public EmailGeneratorService(IEmailSender emailSenderService)
        {
            _emailSenderService = emailSenderService;
            _bodyBuilder = new BodyBuilder();
        }

        /// <inheritdoc/>
        public async Task GenerateEmailForDoctorCreation(Pouzivatel userToDoctor)
        {
            MimeEntity image = LoadLogoToEmail();
            var subject = Resource.SubjectDoctorAccountCreated;
            _bodyBuilder.HtmlBody = "<div style='text-align: center; background-color:  rgba(255, 230, 208, 0.363); width: 50%; position: absolute; margin-left: 25%; border-style: solid; border-width: 1px;border-color: rgba(255, 68, 0, 0.37);" +
             "border-radius:3px; padding: 10px;'>" +
             $"<div><img style='background: #ffe6d0; width: 100px; height: 100px;'" +
             $"src=\"cid:{image.ContentId}\"></img></div>" +
             "<br>" +
             "<div style ='font-size: large; color: dimgray;'>" + userToDoctor.GetFullName() + ",</div>" +
             "<br>" +
             "<div style ='font-size: meddium; color: dimgray;'> Váš účet doktora bol úspešne aktivovaný! </div> " +
             "<br>" +
            "<div style ='font-size: meddium; color: dimgray;'> Aktualizujte si profil a nastavte si profilovú fotku.</div> " +
             "<br>" +
             "<div style ='font-size: meddium; color: dimgray;'> Pekný deň a chráňte si zdravie! </div> " +
             "<div style ='font-size: meddium; color: dimgray;'> The HealthInCube Team </div> "
            + "</div>";

            await CreateMessageAndSendTouserAsync(userToDoctor, subject);
        }

        /// <inheritdoc/>
        public async Task GenerateEmailForPatientCreation(Pouzivatel userToPatient)
        {
            MimeEntity image = LoadLogoToEmail();
            var subject = Resource.SubjectPatientAccountCreated;
            _bodyBuilder.HtmlBody = "<div style='text-align: center; background-color:  rgba(255, 230, 208, 0.363); width: 50%; position: absolute; margin-left: 25%; border-style: solid; border-width: 1px;border-color: rgba(255, 68, 0, 0.37);" +
             "border-radius:3px; padding: 10px;'>" +
             $"<div><img style='background: #ffe6d0; width: 100px; height: 100px;'" +
             $"src=\"cid:{image.ContentId}\"></img></div>" +
             "<br>" +
             "<div style ='font-size: large; color: dimgray;'>" + userToPatient.GetFullName() + ",</div>" +
             "<br>" +
             "<div style ='font-size: meddium; color: dimgray;'> Váš účet pacienta bol úspešne vytvorený! </div> " +
             "<br>" +
            "<div style ='font-size: meddium; color: dimgray;'> Aktualizujte si profil a nastavte si zdravotnú poisťovňu</div> " +
             "<br>" +
             "<div style ='font-size: meddium; color: dimgray;'> Pekný deň a chráňte si zdravie! </div> " +
             "<div style ='font-size: meddium; color: dimgray;'> The HealthInCube Team </div> "
            + "</div>";
            await CreateMessageAndSendTouserAsync(userToPatient, subject);
        }

        private async Task CreateMessageAndSendTouserAsync(Pouzivatel userToPatient, string subject)
        {
            var message = new Message(new string[] { userToPatient.Email }, subject, _bodyBuilder.ToMessageBody());
            await _emailSenderService.SendEmailAsync(message);
        }

        private MimeEntity LoadLogoToEmail()
        {
            string filePath = $"{System.IO.Directory.GetCurrentDirectory()}\\Assets\\logo.jpg";
            var image = _bodyBuilder.LinkedResources.Add(filePath);
            image.ContentId = MimeUtils.GenerateMessageId();
            return image;
        }
    }
}
