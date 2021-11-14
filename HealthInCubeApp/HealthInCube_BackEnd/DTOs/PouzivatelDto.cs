using System;
using System.Collections.Generic;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// User data transfer object.
    /// </summary>
    public class PouzivatelDto
    {
        public decimal Id { get; set; }

        public string Email { get; set; }

        public string Token { get; set; }

        public byte[] Fotka { get; set; }

        public string FullName { get; set; }

        public DateTime ExpirationDateToken {get; set;} = DateTime.Now.AddHours(1);

        public DateTime? PoslednePrihlasenie { get; set; } = DateTime.Now;

        public DateTime? DatNarodenia { get; set; }

        public DateTime Registrovany { get; set; }

        public ICollection<BydliskoDto> Bydliskos { get; set; }

    }
}