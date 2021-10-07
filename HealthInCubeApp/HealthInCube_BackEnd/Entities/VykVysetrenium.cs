using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class VykVysetrenium
    {
        public VykVysetrenium()
        {
            PredpLiecbas = new HashSet<PredpLiecba>();
            Recepts = new HashSet<Recept>();
            ZapChorobies = new HashSet<ZapChoroby>();
        }

        public decimal IdVysetrenie { get; set; }
        public decimal? IdPacient { get; set; }
        public decimal? IdLekar { get; set; }
        public DateTime DatumVys { get; set; }
        public string Vysledok { get; set; }
        public byte[] Priloha { get; set; }

        public virtual Lekar IdLekarNavigation { get; set; }
        public virtual ZdravotnaKartum IdPacientNavigation { get; set; }
        public virtual ICollection<PredpLiecba> PredpLiecbas { get; set; }
        public virtual ICollection<Recept> Recepts { get; set; }
        public virtual ICollection<ZapChoroby> ZapChorobies { get; set; }
    }
}
