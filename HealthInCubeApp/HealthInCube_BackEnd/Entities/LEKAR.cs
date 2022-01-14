using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Lekar
    {
        public Lekar()
        {
            AtestacieLekars = new HashSet<AtestacieLekar>();
            Ziadanky = new HashSet<Ziadanka>();
            Oddelenies = new HashSet<Oddelenie>();
            Pacients = new HashSet<Pacient>();
            VykVysetrenia = new HashSet<VykVysetrenium>();
            ZdravKartaPovolenia = new HashSet<ZdravKartaPovolenium>();
            PracovnaDobas = new HashSet<PracovnaDoba>();
            Sprievodkas = new HashSet<Sprievodka>();
        }

        public decimal IdLekar { get; set; }
        public decimal IdPouzivatel { get; set; }
        public decimal? IdOddel { get; set; }
        public DateTime? Do { get; set; }

        /// <summary>
        /// In average duration of medical revision.
        /// Per pacient.
        /// </summary>
        public byte DlzkaVysetrenia { get; set; }

        public virtual Oddelenie IdOddelNavigation { get; set; }
        public virtual Pouzivatel IdPouzivatelNavigation { get; set; }
        public virtual ICollection<Ziadanka> Ziadanky { get; set; }
        public virtual ICollection<AtestacieLekar> AtestacieLekars { get; set; }
        public virtual ICollection<Oddelenie> Oddelenies { get; set; }
        public virtual ICollection<Pacient> Pacients { get; set; }
        public virtual ICollection<VykVysetrenium> VykVysetrenia { get; set; }
        public virtual ICollection<ZdravKartaPovolenium> ZdravKartaPovolenia { get; set; }
        public virtual ICollection<PracovnaDoba> PracovnaDobas { get; set; }
        public virtual ICollection<Sprievodka> Sprievodkas { get; set; }
    }
}
