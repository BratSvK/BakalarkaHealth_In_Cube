

namespace HealthInCubeModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class LEKAR
    {
        public LEKAR()
        {
            this.ATESTACIE_LEKAR = new HashSet<ATESTACIE_LEKAR>();
            this.VYK_VYSETRENIA = new HashSet<VYK_VYSETRENIA>();
            this.PACIENTs = new HashSet<PACIENT>();
            this.ZDRAV_KARTA_POVOLENIA = new HashSet<ZDRAV_KARTA_POVOLENIA>();
            this.ODDELENIEs = new HashSet<ODDELENIE>();
        }
    
        public decimal ID_LEKAR { get; set; }
        public decimal ID_POUZIVATEL { get; set; }
        public Nullable<decimal> ID_ODDEL { get; set; }
        public Nullable<System.DateTime> DO { get; set; }
    
        public virtual ICollection<ATESTACIE_LEKAR> ATESTACIE_LEKAR { get; set; }
        public virtual POUZIVATEL POUZIVATEL { get; set; }
        public virtual ICollection<VYK_VYSETRENIA> VYK_VYSETRENIA { get; set; }
        public virtual ICollection<PACIENT> PACIENTs { get; set; }
        // public virtual ODDELENIE ODDELENIE { get; set; }
        public virtual ICollection<ZDRAV_KARTA_POVOLENIA> ZDRAV_KARTA_POVOLENIA { get; set; }
        public virtual ICollection<ODDELENIE> ODDELENIEs { get; set; }
    }
}
