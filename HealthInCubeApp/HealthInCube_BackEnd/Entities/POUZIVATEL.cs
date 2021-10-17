using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Pouzivatel : IdentityUser<decimal>
    {
        public Pouzivatel()
        {
            Bydliskos = new HashSet<Bydlisko>();
            Lekars = new HashSet<Lekar>();
            Pacients = new HashSet<Pacient>();
            Ziadanky = new HashSet<Ziadanka>();

        }

       
        public DateTime Registrovany { get; set; } = DateTime.Now;
        public string Meno { get; set; }
        public string Priezvisko { get; set; }
        public string RodPriezvisko { get; set; }
        public string RodCislo { get; set; }
        public DateTime? DatNarodenia { get; set; }
        // public string Email { get; set; }
        public string Mobil { get; set; }
        public DateTime? PoslednePrihlasenie { get; set; }  = DateTime.Now;
        public string Pohlavie { get; set; }

        public virtual FotkaPouzivatel FotkaPouzivatel { get; set; }
        public virtual ICollection<Bydlisko> Bydliskos { get; set; }
        public virtual ICollection<Lekar> Lekars { get; set; }
        public virtual ICollection<Pacient> Pacients { get; set; }

        public virtual ICollection<AppPouzivatelRola> PouzivatelRole { get; set; }

        public virtual ICollection<Ziadanka> Ziadanky { get; set; }


    }
}
