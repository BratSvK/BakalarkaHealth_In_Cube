using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Poistovna
    {
        public Poistovna()
        {
            ZdravPoistenies = new HashSet<ZdravPoistenie>();
        }

        public decimal IdPoistovna { get; set; }
        public string Nazov { get; set; }
        public string KontaktMobil { get; set; }
        public string LogoUrl { get; set; }
        public string OdkazUrl { get; set; }

        public virtual ICollection<ZdravPoistenie> ZdravPoistenies { get; set; }
    }
}
