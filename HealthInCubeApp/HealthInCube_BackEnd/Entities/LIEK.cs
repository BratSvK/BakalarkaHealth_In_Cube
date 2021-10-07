

namespace HealthInCubeModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class LIEK
    {
        public LIEK()
        {
            this.L_BALENIE = new HashSet<L_BALENIE>();
            this.RECEPTs = new HashSet<RECEPT>();
            this.PREDP_LIECBA = new HashSet<PREDP_LIECBA>();
            this.OBLAST_URCENIA = new HashSet<OBLAST_URCENIA>();
            this.UCINNA_LATKA = new HashSet<UCINNA_LATKA>();
        }
    
        public decimal ID_LIEK { get; set; }
        public string NAZOV { get; set; }
        public string REZIM_VYDAJA { get; set; }
        public string LIEK_FORMA { get; set; }
    
        public virtual ICollection<L_BALENIE> L_BALENIE { get; set; }
        public virtual ICollection<RECEPT> RECEPTs { get; set; }
        public virtual ICollection<PREDP_LIECBA> PREDP_LIECBA { get; set; }
        public virtual ICollection<OBLAST_URCENIA> OBLAST_URCENIA { get; set; }
        public virtual ICollection<UCINNA_LATKA> UCINNA_LATKA { get; set; }
    }
}
