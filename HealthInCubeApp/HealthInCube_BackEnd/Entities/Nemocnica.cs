using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Nemocnica
    {
        public Nemocnica()
        {
            Oddelenies = new HashSet<Oddelenie>();
        }

        public decimal IdNem { get; set; }
        public string Nazov { get; set; }
        public string Mobil { get; set; }
        public string Ulica { get; set; }
        public string UrlStranka { get; set; }
        public decimal IdMesto { get; set; }

        public virtual Mesto IdMestoNavigation { get; set; }
        public virtual ICollection<Oddelenie> Oddelenies { get; set; }
    }
}
