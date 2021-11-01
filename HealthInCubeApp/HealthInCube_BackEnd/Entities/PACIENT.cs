using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Pacient
    {
        public Pacient()
        {
            ZdravPoistenies = new HashSet<ZdravPoistenie>();

        }

        public decimal IdPacient { get; set; }
        public decimal IdPouzivatel { get; set; }
        public decimal IdVseobecnyLekar { get; set; }
        public DateTime Od { get; set; } = DateTime.Now;
        public DateTime? Do { get; set; }

        public virtual Pouzivatel IdPouzivatelNavigation { get; set; }
        public virtual Lekar IdVseobecnyLekarNavigation { get; set; }
        public virtual ZdravotnaKartum ZdravotnaKartum { get; set; }
        public virtual ICollection<ZdravPoistenie> ZdravPoistenies { get; set; }

    }
}
