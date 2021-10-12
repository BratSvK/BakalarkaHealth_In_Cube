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
        public DateTime? PoslednePrihlasenie { get; set; }
        [Required]
        public string Pohlavie { get; set; }

        [Required]
        [StringLength(8, MinimumLength= 4)]
        public string Password { get; set; }
    }
}