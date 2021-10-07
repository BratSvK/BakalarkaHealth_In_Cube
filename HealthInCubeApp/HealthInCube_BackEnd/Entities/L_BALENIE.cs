

namespace HealthInCubeModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class L_BALENIE
    {
        public string KOD_BALENIA { get; set; }
        public Nullable<decimal> ID_LIEK { get; set; }
        public string SPOSOB_UHRADY { get; set; }
        public decimal CENA { get; set; }
        public decimal DOPLATOK { get; set; }
        public short POCET_KS { get; set; }
    
        public virtual LIEK LIEK { get; set; }
    }
}
