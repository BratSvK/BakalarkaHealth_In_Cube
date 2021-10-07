using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class ZdravKartaPovolenium
    {
        public decimal IdLekar { get; set; }
        public decimal IdPacient { get; set; }
        public DateTime Od { get; set; }
        public DateTime? Do { get; set; }

        public virtual Lekar IdLekarNavigation { get; set; }
        public virtual ZdravotnaKartum IdPacientNavigation { get; set; }
    }
}
