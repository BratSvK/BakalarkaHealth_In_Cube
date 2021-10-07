using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Oddelenie
    {
        public Oddelenie()
        {
            Lekars = new HashSet<Lekar>();
        }

        public decimal IdOddel { get; set; }
        public decimal IdNem { get; set; }
        public decimal? IdPrimar { get; set; }
        public string NazovOdd { get; set; }

        public virtual Nemocnica IdNemNavigation { get; set; }
        public virtual Lekar IdPrimarNavigation { get; set; }
        public virtual ICollection<Lekar> Lekars { get; set; }
    }
}
