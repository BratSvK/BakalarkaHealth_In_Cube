using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Okres
    {
        public Okres()
        {
            Mestos = new HashSet<Mesto>();
        }

        public decimal IdOkres { get; set; }
        public decimal IdKraj { get; set; }
        public string Nazov { get; set; }

        public virtual ICollection<Mesto> Mestos { get; set; }
    }
}
