using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Rola
    {
        public Rola()
        {
            Pouzivatels = new HashSet<Pouzivatel>();
        }

        public decimal IdTyp { get; set; }
        public string Nazov { get; set; }

        public virtual ICollection<Pouzivatel> Pouzivatels { get; set; }
    }
}
