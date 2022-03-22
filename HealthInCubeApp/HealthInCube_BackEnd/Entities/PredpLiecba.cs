using System;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class PredpLiecba
    {
        public decimal IdLiek { get; set; }
        public decimal IdVysetrenie { get; set; }
        public DateTime Od { get; set; }
        public byte DavkovaniePocet { get; set; }
        public DateTime? Do { get; set; }

        public virtual Liek IdLiekNavigation { get; set; }
        public virtual VykVysetrenium IdVysetrenieNavigation { get; set; }
    }
}
