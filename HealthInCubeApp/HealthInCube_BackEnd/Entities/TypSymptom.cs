using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class TypSymptom
    {
        public TypSymptom()
        {
            Priznakies = new HashSet<Priznaky>();
        }

        public decimal IdSymptom { get; set; }
        public string Nazov { get; set; }

        public virtual ICollection<Priznaky> Priznakies { get; set; }
    }
}
