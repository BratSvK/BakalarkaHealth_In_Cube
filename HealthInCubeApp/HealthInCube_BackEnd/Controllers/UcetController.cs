using System;
using System.Threading.Tasks;
using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HealthInCube_BackEnd.Controllers
{
    public class UcetController : BaseApiController
    {

        private readonly ITokenService _tokenService;
        private readonly IMapper _mapper;
        private readonly UserManager<Pouzivatel> _userManager;
        private readonly SignInManager<Pouzivatel> _signInManager;
        private readonly IZiadankaRepository _ziadankaRepository;
        public UcetController(UserManager<Pouzivatel> userManager, SignInManager<Pouzivatel> signInManager, ITokenService tokenService, IMapper mapper, IZiadankaRepository ziadankaRepository)
        {
            _ziadankaRepository = ziadankaRepository;
            _signInManager = signInManager;
            _userManager = userManager;
            _mapper = mapper;
            _tokenService = tokenService;
        }


        // for registration of new user 
        // async becouse of manipulation with db 
        // api controller is smart enough to figere out where the parameter comming from 

        [HttpPost("register")]
        public async Task<ActionResult<PouzivatelDto>> Register(RegisterPouzivatelDto registeredUser)             // reason to failing we need to send a json object -> for now string username is null
        {
            // check if we have a username in db
            if (await UserExists(registeredUser.Email))
                return BadRequest("Email is taken!!");      //this is type of actionResults 

            // create a user for transition to DB
            var user = _mapper.Map<Pouzivatel>(registeredUser);
            // using is used for disposing a object when we finish the work with it 


            user.Email = registeredUser.Email.ToLower();
            user.UserName = user.Email.Split('@')[0];
            user.Id = await this.PridelIdToNewUserAsync();


            //EF uses 
            var result = await _userManager.CreateAsync(user, registeredUser.Password);     // create user and save changes to DB 

            if (!result.Succeeded) return BadRequest(result.Errors);

            // adding a member role to  new user -> registration is only for pacient
            var roleResult = await _userManager.AddToRoleAsync(user, "Pacient");

            if (!roleResult.Succeeded) return BadRequest(result.Errors);

            // here we need to send ziadanka  to Lekar 

            var ziadanka = new Ziadanka {
                IdPacient = user.Id,
                IdLekar = registeredUser.IdDoctor
            };

            _ziadankaRepository.InsertItem(ziadanka);

            if (await _ziadankaRepository.SaveAllAsync())
            {
                return Ok(new PouzivatelDto
                {
                    Email = user.Email,
                    Token = await _tokenService.CreateToken(user),
                    Pohlavie = user.Pohlavie,
                    Bydliskos = user.Bydliskos

                });
            }

            return BadRequest("Failed to register !!");
            
        }

        private async Task<decimal> PridelIdToNewUserAsync()
        {
            return await _userManager.Users.CountAsync() + 1;
        }

        [HttpPost("login")]
        public async Task<ActionResult<PouzivatelDto>> Login(PrihlaseniePouzivatelDto loginUser)
        {
            // making request we need await
            var user = await _userManager.Users
                .Include(p => p.Bydliskos)
                .SingleOrDefaultAsync(user => user.Email == loginUser.Email.ToLower());

            if (user == null)
                return Unauthorized("Invalid email");

            // prihalsenie cez singIn manazera
            var result = await _signInManager.CheckPasswordSignInAsync(user, loginUser.Password, false);        // dont lock out the user if has bas credentials 

            if (!result.Succeeded) return Unauthorized();

            return new PouzivatelDto
            {
                Email = user.Email,
                Token = await _tokenService.CreateToken(user),
                Pohlavie = user.Pohlavie,
                Bydliskos = user.Bydliskos
            };
        }

        // async becouse we are working with db
        private async Task<bool> UserExists(string email)
        {
            // check if any username in Users table matches this name 
            return await _userManager.Users.AnyAsync(x => x.Email == email.ToLower());

        }
    }
}