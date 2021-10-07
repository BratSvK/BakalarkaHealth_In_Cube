using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class ZdravPoistenie
    {
        public decimal IdPoistovna { get; set; }
        public decimal IdPacient { get; set; }
        public DateTime Od { get; set; }
        public DateTime? Do { get; set; }

        public virtual Pacient IdPacientNavigation { get; set; }
        public virtual Poistovna IdPoistovnaNavigation { get; set; }
    }
}
