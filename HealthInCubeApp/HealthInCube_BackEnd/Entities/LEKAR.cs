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
        }

        public decimal IdLekar { get; set; }
        public decimal IdPouzivatel { get; set; }
        public decimal? IdOddel { get; set; }
        public DateTime? Do { get; set; }

        public virtual Oddelenie IdOddelNavigation { get; set; }
        public virtual Pouzivatel IdPouzivatelNavigation { get; set; }
        public virtual ICollection<Ziadanka> Ziadanky { get; set; }
        public virtual ICollection<AtestacieLekar> AtestacieLekars { get; set; }
        public virtual ICollection<Oddelenie> Oddelenies { get; set; }
        public virtual ICollection<Pacient> Pacients { get; set; }
        public virtual ICollection<VykVysetrenium> VykVysetrenia { get; set; }
        public virtual ICollection<ZdravKartaPovolenium> ZdravKartaPovolenia { get; set; }
    }
}
