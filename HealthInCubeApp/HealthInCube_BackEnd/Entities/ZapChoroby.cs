using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class ZapChoroby
    {
        public ZapChoroby()
        {
            Priznakies = new HashSet<Priznaky>();
        }

        public decimal IdZdravotnaKarta { get; set; }
        public string CisChoroba { get; set; }
        public DateTime Od { get; set; }
        public decimal IdVysetrenie { get; set; }
        public DateTime? Do { get; set; }

        public virtual Choroba CisChorobaNavigation { get; set; }
        public virtual VykVysetrenium IdVysetrenieNavigation { get; set; }
        public virtual ZdravotnaKartum IdZdravotnaKartaNavigation { get; set; }
        public virtual ICollection<Priznaky> Priznakies { get; set; }
    }
}
