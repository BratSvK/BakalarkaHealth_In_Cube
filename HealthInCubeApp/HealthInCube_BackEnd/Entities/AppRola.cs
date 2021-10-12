using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;

namespace HealthInCube_BackEnd.Entities
{
    public class AppRola : IdentityRole<decimal>
    {
        public ICollection<AppPouzivatelRola> PouzivatelRole { get; set; }
        
    }
}