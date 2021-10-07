using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class OblastUrcenia
    {
        public OblastUrcenia()
        {
            LiekAplikacia = new HashSet<LiekAplikacium>();
        }

        public decimal IdOblast { get; set; }
        public string Nazov { get; set; }

        public virtual ICollection<LiekAplikacium> LiekAplikacia { get; set; }
    }
}
