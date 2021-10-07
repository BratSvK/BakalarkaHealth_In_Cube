using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Pouzivatel
    {
        public Pouzivatel()
        {
            Bydliskos = new HashSet<Bydlisko>();
            Lekars = new HashSet<Lekar>();
            Pacients = new HashSet<Pacient>();
        }

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

        public virtual Rola IdTypNavigation { get; set; }
        public virtual FotkaPouzivatel FotkaPouzivatel { get; set; }
        public virtual ICollection<Bydlisko> Bydliskos { get; set; }
        public virtual ICollection<Lekar> Lekars { get; set; }
        public virtual ICollection<Pacient> Pacients { get; set; }
    }
}
