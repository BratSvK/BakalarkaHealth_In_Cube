using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Mesto
    {
        public Mesto()
        {
            Bydliskos = new HashSet<Bydlisko>();
            Nemocnicas = new HashSet<Nemocnica>();
            ZdravotnaKarta = new HashSet<ZdravotnaKartum>();
        }

        public decimal IdOkres { get; set; }
        public string Nazov { get; set; }
        public decimal IdMesto { get; set; }

        public virtual Okres IdOkresNavigation { get; set; }
        public virtual ICollection<Bydlisko> Bydliskos { get; set; }
        public virtual ICollection<Nemocnica> Nemocnicas { get; set; }
        public virtual ICollection<ZdravotnaKartum> ZdravotnaKarta { get; set; }
    }
}
