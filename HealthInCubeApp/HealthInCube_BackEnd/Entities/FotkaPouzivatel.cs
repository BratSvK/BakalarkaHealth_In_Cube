using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class FotkaPouzivatel
    {
        public decimal IdPouzivatel { get; set; }
        public byte[] Fotka { get; set; }

        public virtual Pouzivatel IdPouzivatelNavigation { get; set; }
    }
}
