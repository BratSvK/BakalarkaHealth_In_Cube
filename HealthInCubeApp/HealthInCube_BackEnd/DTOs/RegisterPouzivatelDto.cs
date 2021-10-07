using System;

namespace HealthInCube_BackEnd.DTOs
{
    public class RegisterPouzivatelDto
    {
        public decimal IdPouzivatel { get; set; }
        public decimal IdTyp { get; set; }
        public DateTime Registrovany { get; set; }
        public string Meno { get; set; }
        public string Priezvisko { get; set; }
        public string RodPriezvisko { get; set; }
        public string RodCislo { get; set; }
        public DateTime? DatNarodenia { get; set; }
        public string Email { get; set; }
        public string Mobil { get; set; }
        public DateTime? PoslednePrihlasenie { get; set; }
        public string Pohlavie { get; set; }
    }
}