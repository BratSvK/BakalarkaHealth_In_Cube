using System.Collections.Generic;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.DTOs
{
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
                return $"{Meno.Trim()} {Priezvisko}";
            }

        }

        public string Nemocnica { get; set; }
        public string OddelenieNazov { get; set; }
        public ICollection<AtestacieLekar> Atestacie { get; set; }


        
        
    }
}