using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class LiekUcinnaLatka
    {
        public decimal IdLiek { get; set; }
        public decimal IdLatka { get; set; }

        public virtual UcinnaLatka IdLatkaNavigation { get; set; }
        public virtual Liek IdLiekNavigation { get; set; }
    }
}
