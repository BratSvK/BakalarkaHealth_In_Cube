using System;
using System.Collections.Generic;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.DTOs
{
    public class PouzivatelDto
    {
        public decimal Id { get; set; }
        public string Email { get; set; }
        public string Token { get; set; }
        public byte[] Fotka { get; set; }

        public string FullName { get; set; }

        public DateTime ExpirationDateToken {get; set;} = DateTime.UtcNow.AddHours(1);

        public string LivingCity { get; set; }


        // public ICollection<Bydlisko> Bydliskos { get; set; }

    }
}