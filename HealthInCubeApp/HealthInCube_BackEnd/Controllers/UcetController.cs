using System;
using System.Threading.Tasks;
using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Extensions;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using Microsoft.Extensions.Configuration;
using System.Net.Mail;

namespace HealthInCube_BackEnd.Controllers
{
    /// <summary>
    /// Controller for login and register.
    /// </summary>
    public class UcetController : BaseApiController
    {

        private readonly ITokenService _tokenService;
        private readonly IMapper _mapper;
        private readonly UserManager<Pouzivatel> _userManager;
        private readonly SignInManager<Pouzivatel> _signInManager;
        private readonly IZiadankaRepository _ziadankaRepository;
        private readonly IFotoRepository _fotoRepository;
        private readonly IPouzivatelRepository _pouzivatelRepository;
        private readonly IConfiguration _config;

        public UcetController(UserManager<Pouzivatel> userManager, SignInManager<Pouzivatel> signInManager, IConfiguration config, IPouzivatelRepository pouzivatelRepository, IFotoRepository fotoRepository, ITokenService tokenService, IMapper mapper, IZiadankaRepository ziadankaRepository)
        {
            _config = config;
            _pouzivatelRepository = pouzivatelRepository;
            _fotoRepository = fotoRepository;
            _ziadankaRepository = ziadankaRepository;
            _signInManager = signInManager;
            _userManager = userManager;
            _mapper = mapper;
            _tokenService = tokenService;
        }

        /// <summary>
        /// Register method.
        /// Reason to failing we need to send a json object -> for now string username is null
        /// </summary>
        /// <param name="registeredUser">register object to work with</param>
        /// <returns></returns>
        [HttpPost("register")]
        public async Task<ActionResult<PouzivatelDto>> Register(RegisterPouzivatelDto registeredUser)             
        {
            // check if we have a username in db
            if (await UserExists(registeredUser.Email))
                return BadRequest("Email is taken!!");     

            // create a user for transition to DB
            var user = _mapper.Map<Pouzivatel>(registeredUser);
            // using is used for disposing a object when we finish the work with it 

            user.Email = registeredUser.Email.ToLower();
            user.UserName = user.Email.Split('@')[0];
            user.Id = await this.PridelIdToNewUserAsync();
            var adresaRegister = registeredUser.Adresa;
            adresaRegister.IdBydliska = this.PridelIdToNewBydliskoAsync(user.Id).Result;
            var bydliskoToUser = _mapper.Map<Bydlisko>(adresaRegister);
            user.Bydliskos.Add(bydliskoToUser);
            user.IdMestoNarodenia = registeredUser.Mesto.IdMesto;

            //EF uses 
            var result = await _userManager.CreateAsync(user, registeredUser.Password);     // create user and save changes to DB 

            if (!result.Succeeded) return BadRequest(result.Errors);

            // adding a member role to  new user -> registration is only for pacient
            var roleResult = await _userManager.AddToRoleAsync(user, "Pacient");

            if (!roleResult.Succeeded) return BadRequest(result.Errors);

            // here we need to send ziadanka  to Lekar 
            var ziadanka = new Ziadanka
            {
                IdUser = user.Id,
                IdLekar = registeredUser.IdDoctor
            };

            _ziadankaRepository.InsertItem(ziadanka);

            if (await _ziadankaRepository.SaveAllAsync())
            {
                return Ok(new PouzivatelDto
                {
                    Email = user.Email,
                    Token = _tokenService.CreateToken(user).Result,
                    FullName = user.GetFullName(),
                    Fotka = _fotoRepository.GetFotkaByUserId(user.Id).Result?.Fotka,
                    Id = user.Id
                });
            }

            return BadRequest("Failed to register !!");
        }

      
        /// <summary>
        /// Login user to application.
        /// </summary>
        /// <param name="loginUser">email and password</param>
        [HttpPost("login")]
        public async Task<ActionResult<PouzivatelDto>> Login(PrihlaseniePouzivatelDto loginUser)
        {
            // making request we need await
            var user = await _userManager.Users
                .SingleOrDefaultAsync(user => user.Email == loginUser.Email.ToLower());

            if (user == null)
                return NotFound("EMAIL_NOT_FOUND");

            // prihalsenie cez singIn manazera
            var result = await _signInManager.CheckPasswordSignInAsync(user, loginUser.Password, false);        // dont lock out the user if has bas credentials 

            if (!result.Succeeded) return Unauthorized("INVALID_CREDENTIALS");

            return Ok(new PouzivatelDto
            {
                Email = user.Email,
                Token = await _tokenService.CreateToken(user),
                FullName = user.GetFullName(),
                Fotka = _fotoRepository.GetFotkaByUserId(user.Id).Result?.Fotka,
                Id = user.Id
            });
        }



        /// <summary>
        /// Sending email to user after account creation.
        /// </summary>
        /// <param name="mailToSend"></param>
        /// <returns></returns>
        [HttpPost("mail")]
        public IActionResult SendAccReqConfMail([FromBody] MailDto mailToSend)
        {
            if (mailToSend == null)
            {
                return BadRequest("Mail structure is null");
            }
            var smtpAddress = _config["Smtp:Host"];
            var portNumber = int.Parse(_config["Smtp:Port"]);
            var enableSSL = true;
            var emailFromAddress = _config["Smtp:Username"]; //Sender Email Address  
            var password = _config["Smtp:Password"]; //Sender Password  
            var emailToAddress = mailToSend.ReceiverEmail;

            var subject = "Your Account has been created";
            var body = "<div style='text-align: center; background-color:  rgba(255, 230, 208, 0.363); width: 50%; position: absolute; margin-left: 25%; border-style: solid; border-width: 1px;border-color: rgba(255, 68, 0, 0.37);" +
             "border-radius:3px; padding: 10px;'>" + "<div style ='font-size: large; color: dimgray;'>Dear " + mailToSend.ReceiverFullName + ",</div>" +
             "<br>" +
             "<div style ='font-size: meddium; color: dimgray;'> Thank you for your creation. </div> " +
             "<br>" +
            "<div style ='font-size: meddium; color: dimgray;'> Please wait till your doctor aproved your patient and health status</div> " +
             "<br>" +
            "<div style ='font-size: meddium; color: dimgray;'> For now please update your user profil and upload your main photo to acount</div> " +
             "<br>" +
             "<div style ='font-size: meddium; color: dimgray;'> Have a nice day!  </div> " +
             "<div style ='font-size: meddium; color: dimgray;'> The HealthInCube Team </div> "
            + "</div>";
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFromAddress);
                mail.To.Add(emailToAddress);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                //mail.Attachments.Add(new Attachment("D:\\TestFile.txt"));//--Uncomment this to send any attachment  
                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new System.Net.NetworkCredential(emailFromAddress, password);
                    smtp.EnableSsl = enableSSL;
                    smtp.Send(mail);
                }
            }
            return Ok();
        }

        private async Task<bool> UserExists(string email)
        {
            // check if any username in Users table matches this name 
            return await _userManager.Users.AnyAsync(x => x.Email == email.ToLower());

        }
        private async Task<decimal> PridelIdToNewBydliskoAsync(decimal pouzivatelId)
        {
            var bydliska = await _pouzivatelRepository.GetBydliskaAsync(pouzivatelId);
            if (bydliska == null)
            {
                return 1;
            }
            return bydliska.Count() + 1;
        }
        private async Task<decimal> PridelIdToNewUserAsync()
        {
            return await _userManager.Users.CountAsync() + 1;
        }
    }
}