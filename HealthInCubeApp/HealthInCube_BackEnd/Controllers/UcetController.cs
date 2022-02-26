using System.Threading.Tasks;
using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Extensions;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Net.Mail;
using System.Net.Mime;
using HealthInCube_BackEnd.DTOs.Lekar;
using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;
using EmailService.Models;
using HealthInCube_BackEnd.Properties;
using EmailService.Services;
using MimeKit;
using HealthInCube_BackEnd.DTOs.ResetPassword;
using Microsoft.AspNetCore.WebUtilities;
using System.Linq;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs.Lekar.PracovnaDoba;

namespace HealthInCube_BackEnd.Controllers
{
    /// <summary>
    /// Controller for login and register.
    /// </summary>
    [AllowAnonymous]
    public class UcetController : BaseApiController
    {
        private readonly ITokenService _tokenService;
        private readonly IMapper _mapper;
        private readonly UserManager<Pouzivatel> _userManager;
        private readonly SignInManager<Pouzivatel> _signInManager;
        private readonly IZiadankaRepository _ziadankaRepository;
        private readonly IBydliskoRepository _bydliskoRepository;
        private readonly ILekarRepository _lekarRepository;
        private readonly IEmailSender _emailSender;
        private readonly IFotoRepository _fotoRepository;
        private readonly IPouzivatelRepository _pouzivatelRepository;
        private readonly IConfiguration _config;

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="userManager"></param>
        /// <param name="signInManager"></param>
        /// <param name="config"></param>
        /// <param name="pouzivatelRepository"></param>
        /// <param name="fotoRepository"></param>
        /// <param name="tokenService"></param>
        /// <param name="mapper"></param>
        /// <param name="ziadankaRepository"></param>
        /// <param name="bydliskoRepository"></param>
        /// <param name="lekarRepository"></param>
        /// <param name="emailSender"></param>
        public UcetController(
            UserManager<Pouzivatel> userManager, 
            SignInManager<Pouzivatel> signInManager, 
            IConfiguration config, 
            IPouzivatelRepository pouzivatelRepository, 
            IFotoRepository fotoRepository, 
            ITokenService tokenService, 
            IMapper mapper, 
            IZiadankaRepository ziadankaRepository, 
            IBydliskoRepository bydliskoRepository, 
            ILekarRepository lekarRepository,
            IEmailSender emailSender)
        {
            _config = config;
            _pouzivatelRepository = pouzivatelRepository;
            _fotoRepository = fotoRepository;
            _ziadankaRepository = ziadankaRepository;
            _bydliskoRepository = bydliskoRepository;
            _lekarRepository = lekarRepository;
            _emailSender = emailSender;
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
            user.Id = _pouzivatelRepository.GetCountAsync().Result + 1;
            var adresaRegister = registeredUser.Adresa;
            var bydliskoToUser = _mapper.Map<Bydlisko>(adresaRegister);
            user.Bydliskos.Add(bydliskoToUser);

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
                    Fotka = _fotoRepository.GetItemAsync(user.Id).Result?.Fotka,
                    Id = user.Id
                });
            }

            return BadRequest("Failed to register !!");
        }

        /// <summary>
        /// Register method.
        /// Reason to failing we need to send a json object -> for now string username is null
        /// </summary>
        /// <param name="registeredUser">register object to work with</param>
        /// <returns></returns>
        [HttpPost("register/lekar")]
        public async Task<IActionResult> RegisterDoctor(LekarRegisterDto lekarRegister)
        {
            // check if we have a username in db
            if (await UserExists(lekarRegister.Email))
                return BadRequest("Email is taken!!");

            // create a user for transition to DB
            var user = _mapper.Map<Pouzivatel>(lekarRegister);
            // using is used for disposing a object when we finish the work with it 

            user.Email = lekarRegister.Email.ToLower();
            user.UserName = user.Email.Split('@')[0];
            user.Id = _pouzivatelRepository.GetCountAsync().Result + 1;
            var adresaRegister = lekarRegister.Adresa;
            var bydliskoToUser = _mapper.Map<Bydlisko>(adresaRegister);
            user.Bydliskos.Add(bydliskoToUser);

            // EF uses
            // create user and save changes to DB 
            var result = await _userManager.CreateAsync(user, lekarRegister.Password);     
            if (!result.Succeeded) return BadRequest(result.Errors);

            // adding a member role to  new user -> registration is only for pacient
            var roleResult = await _userManager.AddToRoleAsync(user, "Lekar");

            if (!roleResult.Succeeded) return BadRequest(result.Errors);
            var pracovnaDoba = lekarRegister.PracovnaDobas.Select(x => _mapper.Map<PracovnaDoba>(x)).ToList();

            var lekar = new Lekar
            {
                IdLekar = _lekarRepository.GetCountAsync().Result + 1,
                IdPouzivatel = user.Id,
                PracovnaDobas = pracovnaDoba,
                IdOddel = lekarRegister.IdOddelenie,
                DlzkaVysetrenia = lekarRegister.DlzkaVysetrenia
            };

            //pridanie id lekara ku atestaciam
            foreach (AtestaciaLekarDto atestacia in lekarRegister.AtestacieLekars)
            {
                atestacia.IdLekar = lekar.IdLekar;
            }

            var atestacie = lekarRegister.AtestacieLekars.Select(x => _mapper.Map<AtestacieLekar>(x)).ToList();
            lekar.AtestacieLekars = atestacie;

            _lekarRepository.InsertItem(lekar);

            // here we need to send ziadanka  to Admin 
            var ziadanka = new ZiadankaLekar
            {
                IdUser = user.Id,
                IdNemocnica = lekarRegister.IdNemocnica
            };
            _ziadankaRepository.InsertDoctorRequests(ziadanka);

            if (await _ziadankaRepository.SaveAllAsync())
            {
                return Ok();
            }

            return BadRequest("Failed to register lekar!!");
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
                return Unauthorized("EMAIL_NOT_FOUND");

            // prihalsenie cez singIn manazera
            var result = await _signInManager.CheckPasswordSignInAsync(user, loginUser.Password, false);        // dont lock out the user if has bas credentials 

            if (!result.Succeeded) return Unauthorized("INVALID_CREDENTIALS");

            await _userManager.RememberLoginDate(user);

            return Ok(new PouzivatelDto
            {
                Email = user.Email,
                Token = await _tokenService.CreateToken(user),
                FullName = user.GetFullName(),
                Fotka = _fotoRepository.GetItemAsync(user.Id).Result?.Fotka,
                Id = user.Id
            });
        }


        /// <summary>
        /// Forgot password for user.
        /// </summary>
        /// <param name="forgotPasswordUser">email and client Uri to redirect with link.</param>
        [HttpPost("forgotPassword")]
        public async Task<IActionResult> ForgotPassword([FromBody] ForgotPasswordDto forgotPasswordUser)
        {
            // making request we need await
            var user = await _userManager.Users
                .SingleOrDefaultAsync(user => user.Email == forgotPasswordUser.Email.ToLower());

            if (user == null)
                return BadRequest("EMAIL_NOT_FOUND");

            var token = await _userManager.GeneratePasswordResetTokenAsync(user);

            var param = new Dictionary<string, string>
            {
                {"token", token },
                {"email", forgotPasswordUser.Email }
            };

            var callback = QueryHelpers.AddQueryString(forgotPasswordUser.ClientURI, param);
            var builder = new BodyBuilder();
            builder.TextBody = callback;
            var message = new Message(new string[] { user.Email }, Resource.SubjectResetPasswordToken, builder.ToMessageBody());
            await _emailSender.SendEmailAsync(message);

            return Ok();
        }

        /// <summary>
        /// Reset password for user.
        /// </summary>
        /// <param name="loginUser">email and password</param>
        [HttpPost("resetPassword")]
        public async Task<IActionResult> ResetPassword(ResetPasswordDto resetPasswordUser)
        {
            // making request we need await
            var user =  await _userManager.Users
                .SingleOrDefaultAsync(user => user.Email == resetPasswordUser.Email.ToLower());

            if (user == null)
                return BadRequest("EMAIL_NOT_FOUND");

            var resetPasswordResult = await _userManager.ResetPasswordAsync(user, resetPasswordUser.Token, resetPasswordUser.Password);
            if (!resetPasswordResult.Succeeded)
            {
                var errors = resetPasswordResult.Errors.Select(e => e.Description);
                return BadRequest(new {Errors = errors });
            }

            return Ok();
        }
        private async Task<bool> UserExists(string email)  => await _userManager.Users.AnyAsync(x => x.Email == email.ToLower());
    }
}