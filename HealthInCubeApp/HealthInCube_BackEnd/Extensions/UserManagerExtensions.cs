using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HealthInCube_BackEnd.Entities;
using Microsoft.AspNetCore.Identity;

namespace HealthInCube_BackEnd.Extensions
{
    public static class UserManagerExtensions
    {
        public static async Task<IdentityResult> RememberLoginDate(this UserManager<Pouzivatel> manager, Pouzivatel user)
        {
            user.PoslednePrihlasenie = DateTime.Now; ;
            return await manager.UpdateAsync(user);
        }
    }
}
