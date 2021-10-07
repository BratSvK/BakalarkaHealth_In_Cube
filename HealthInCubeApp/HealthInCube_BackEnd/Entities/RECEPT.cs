using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Recept
    {
        public decimal IdRecept { get; set; }
        public decimal IdVysetrenie { get; set; }
        public decimal IdLiek { get; set; }
        public byte BalenieKs { get; set; }
        public DateTime Vystavenie { get; set; }
        public decimal? Cena { get; set; }
        public DateTime? Vybranie { get; set; }

        public virtual Liek IdLiekNavigation { get; set; }
        public virtual VykVysetrenium IdVysetrenieNavigation { get; set; }
    }
}
