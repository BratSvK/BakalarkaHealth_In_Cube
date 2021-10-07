using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class TypLekara
    {
        public TypLekara()
        {
            AtestacieLekars = new HashSet<AtestacieLekar>();
        }

        public decimal IdTyp { get; set; }
        public string Nazov { get; set; }
        public string Popis { get; set; }

        public virtual ICollection<AtestacieLekar> AtestacieLekars { get; set; }
    }
}
