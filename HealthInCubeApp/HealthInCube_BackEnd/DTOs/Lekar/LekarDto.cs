using HealthInCube_BackEnd.DTOs.Lekar;
using System.Collections.Generic;

namespace HealthInCube_BackEnd.DTOs
{
    public enum TypVseobecnyLekar
    {
        Detsky = 65,
        Dospely = 66
    }

    public class LekarDto
    {

        public decimal IdLekar { get; set; }
        public string Meno { get; set; }
        public string Priezvisko { get; set; }
        public string Mobil { get; set; }
        public string Email { get; set; }

        public string FullName
        {
            get
            {
                return $"{Meno?.Trim()} {Priezvisko}";
            }

        }

        public byte[] Fotka { get; set; }
        public string Nemocnica { get; set; }
        public string OddelenieNazov { get; set; }
        public bool IsActivated { get; set; } = false;
        public ICollection<decimal> AtestacieId { get; set; }
        public ICollection<LekarTypAtestacieDto> AtestacieLekars { get; set; }
    }
}