using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Choroba
    {
        public Choroba()
        {
            ZapChorobies = new HashSet<ZapChoroby>();
        }

        public string CisChoroba { get; set; }
        public string Nazov { get; set; }
        public string SkOchoreni { get; set; }
        public byte? ObmVekOd { get; set; }
        public byte? ObmVekDo { get; set; }
        public string ObmPohlavie { get; set; }
        public DateTime ValidOd { get; set; }
        public DateTime? ValidDo { get; set; }
        public string DoplInfoPatri { get; set; }
        public string DoplInfoNepatri { get; set; }

        public virtual ICollection<ZapChoroby> ZapChorobies { get; set; }
    }
}
