using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class LBalenie
    {
        public string KodBalenia { get; set; }
        public decimal? IdLiek { get; set; }
        public string SposobUhrady { get; set; }
        public decimal Cena { get; set; }
        public decimal Doplatok { get; set; }
        public byte PocetKs { get; set; }

        public virtual Liek IdLiekNavigation { get; set; }

        public virtual ICollection<Recept> Recepts { get; set; }
    }
}
