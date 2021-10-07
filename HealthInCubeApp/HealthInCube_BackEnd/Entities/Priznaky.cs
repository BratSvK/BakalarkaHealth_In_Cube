using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Priznaky
    {
        public string CisChoroba { get; set; }
        public decimal IdZdravotnaKarta { get; set; }
        public decimal IdSymptom { get; set; }
        public DateTime Od { get; set; }

        public virtual TypSymptom IdSymptomNavigation { get; set; }
        public virtual ZapChoroby ZapChoroby { get; set; }
    }
}
