using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class AtestacieLekar
    {
        public decimal IdLekar { get; set; }
        public decimal IdTyp { get; set; }
        public decimal IdAtestacia { get; set; }
        public DateTime AtestaciaOd { get; set; }

        public virtual Lekar IdLekarNavigation { get; set; }
        public virtual TypLekara IdTypNavigation { get; set; }
    }
}
