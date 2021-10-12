using System.Collections.Generic;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.DTOs
{
    public class PouzivatelDto
    {
        
        public string Email { get; set; }
        public string Token { get; set; }

        public string Pohlavie { get; set; }

        public ICollection<Bydlisko> Bydliskos { get; set; }

    }
}