using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HealthInCube_BackEnd.Controllers
{
    public class SpravcaController : BaseApiController
    {
        private readonly INemocnicaRepistory _nemocnicaRepository;
        private readonly UserManager<Pouzivatel> _userManager;

        public SpravcaController(INemocnicaRepistory nemocnicaRepository, UserManager<Pouzivatel> userManager)
        {
            _userManager = userManager;
            _nemocnicaRepository = nemocnicaRepository;
        }

        #region User-Roles
        // autohrized by policy 
        [Authorize(Roles = "Spravca")]
        [HttpGet("users-with-roles")]
        public async Task<ActionResult> GetUsersWithRoles()
        {
            var users = await _userManager.Users
                .Include(r => r.PouzivatelRole)
                .ThenInclude(r => r.PouzivatelRola)
                .OrderBy(u => u.UserName)
                .Select(u => new
                {
                    u.Id,
                    UserName = u.UserName,
                    RoleStoreBase = u.PouzivatelRole.Select(r => r.PouzivatelRola.Name).ToList()
                })
                .ToListAsync();

            return Ok(users);
        }


        [Authorize(Roles = "Spravca")]
        [HttpPost("edit-roles/{username}")]
        public async Task<ActionResult> EditRoles(string username, [FromQuery] string roles)
        {   
            // create an array of roles from query 
            var selectedRoles = roles.Split(",").ToArray();

            var user = await _userManager.FindByNameAsync(username);

            if (user == null) return NotFound("Could not find user");

            var userRoles = await _userManager.GetRolesAsync(user);
            var result = await _userManager.AddToRolesAsync(user, selectedRoles.Except(userRoles));         // nahra dve rozdelne array do seba

            if (!result.Succeeded) return BadRequest("Failed to add to roles");

            result = await _userManager.RemoveFromRolesAsync(user, userRoles.Except(selectedRoles));

            if (!result.Succeeded) return BadRequest("Failed to remove from roles");

                return Ok(await _userManager.GetRolesAsync(user));
        }
        

        #endregion



        [HttpGet("nemocnice")]
        public async Task<ActionResult<IEnumerable<NemocnicaDto>>> GetNemocnice()
        {
            var nemocnice = await _nemocnicaRepository.GetItemsAsync();

            if (nemocnice == null) return NotFound("Nothing found");

            return Ok(nemocnice);

        }




    }
}