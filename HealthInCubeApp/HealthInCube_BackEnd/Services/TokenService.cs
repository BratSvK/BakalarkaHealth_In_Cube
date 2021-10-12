using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace HealthInCube_BackEnd.Services
{
    public class TokenService : ITokenService
    {

        // this key is not going anywhere 
        private readonly SymmetricSecurityKey _key;         // Asymmetrics uses https and ssl
        private readonly UserManager<Pouzivatel> _userManager;
        public TokenService(IConfiguration congig, UserManager<Pouzivatel> userManager)
        {
            _userManager = userManager;
            _key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(congig["TokenKey"]));
        }


        public async Task<string> CreateToken(Pouzivatel user)
        {
            var claims = new List<Claim>
            {
                // safe place to place a roles
                // we cannot modify a token 
                new Claim(JwtRegisteredClaimNames.NameId, user.Id.ToString()),          // userID
                new Claim(JwtRegisteredClaimNames.Email, user.Email),                              // Email

            };

            var roles = await _userManager.GetRolesAsync(user);

            // select role in list of roles 
            claims.AddRange(roles.Select(role => new Claim(ClaimTypes.Role, role)));



            // create some credentials
            var credentials = new SigningCredentials(_key, SecurityAlgorithms.HmacSha512Signature);
            // describe our token -> how our token will look for particular user in our app
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.Now.AddDays(7),              // how long is goin to be valid for 
                SigningCredentials = credentials
            };

            // token handler 
            var tokenHandler = new JwtSecurityTokenHandler();

            var token = tokenHandler.CreateToken(tokenDescriptor);

            return tokenHandler.WriteToken(token);
        }
    }
}
