using System;
using System.ComponentModel.DataAnnotations;

namespace HealthInCube_BackEnd.DTOs
{
    public class RegisterPouzivatelDto
    {
        [Required]
        public string Meno { get; set; }

        [Required]
        public string Priezvisko { get; set; }

        public string RodPriezvisko { get; set; }

        public string RodCislo { get; set; }

        public DateTime? DatNarodenia { get; set;}
        [Required]
        public string Email { get; set; }

        public string Mobil { get; set; }

        [Required]
        public string Pohlavie { get; set; }

        [Required]
        [StringLength(10, MinimumLength= 4)]
        public string Password { get; set; }

        public decimal IdDoctor { get; set; }

        [Required]
        public BydliskoDto Adresa { get; set; }

        [Required]
        public decimal IdMestoNarodenia { get; set; }
    }
}