using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class ZdravotnaKartum
    {
        public ZdravotnaKartum()
        {
            VykVysetrenia = new HashSet<VykVysetrenium>();
            ZapChorobies = new HashSet<ZapChoroby>();
            ZdravKartaPovolenia = new HashSet<ZdravKartaPovolenium>();
        }

        public decimal IdPacient { get; set; }
        public string KrvSkupina { get; set; }
        public decimal IdMestoNarodenia { get; set; }

        public virtual Mesto IdMestoNarodeniaNavigation { get; set; }
        public virtual Pacient IdPacientNavigation { get; set; }
        public virtual ICollection<VykVysetrenium> VykVysetrenia { get; set; }
        public virtual ICollection<ZapChoroby> ZapChorobies { get; set; }
        public virtual ICollection<ZdravKartaPovolenium> ZdravKartaPovolenia { get; set; }
    }
}
