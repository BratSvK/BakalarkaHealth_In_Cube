using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class LiekAplikacium
    {
        public decimal IdLiek { get; set; }
        public decimal IdOblast { get; set; }

        public virtual Liek IdLiekNavigation { get; set; }
        public virtual OblastUrcenia IdOblastNavigation { get; set; }
    }
}
