using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class UcinnaLatka
    {
        public UcinnaLatka()
        {
            LiekUcinnaLatkas = new HashSet<LiekUcinnaLatka>();
        }

        public decimal IdLatka { get; set; }
        public decimal? IdLiek { get; set; }
        public string UcinnaLatka1 { get; set; }
        public int? UcinnaLatkaGramaz { get; set; }

        public virtual ICollection<LiekUcinnaLatka> LiekUcinnaLatkas { get; set; }
    }
}
