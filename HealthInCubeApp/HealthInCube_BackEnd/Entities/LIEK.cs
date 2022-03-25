using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Liek
    {
        public Liek()
        {
            LBalenies = new HashSet<LBalenie>();
            LiekAplikacia = new HashSet<LiekAplikacium>();
            LiekUcinnaLatkas = new HashSet<LiekUcinnaLatka>();
            PredpLiecbas = new HashSet<PredpLiecba>();
            Recepts = new HashSet<Recept>();
        }

        public decimal IdLiek { get; set; }
        public string Nazov { get; set; }
        public string RezimVydaja { get; set; }
        public string LiekForma { get; set; }

        public virtual LiekDavkovanie IdLiekDavkovanieNavigation { get; set; }

        public virtual ICollection<LBalenie> LBalenies { get; set; }
        public virtual ICollection<LiekAplikacium> LiekAplikacia { get; set; }
        public virtual ICollection<LiekUcinnaLatka> LiekUcinnaLatkas { get; set; }
        public virtual ICollection<PredpLiecba> PredpLiecbas { get; set; }
        public virtual ICollection<Recept> Recepts { get; set; }
    }
}
