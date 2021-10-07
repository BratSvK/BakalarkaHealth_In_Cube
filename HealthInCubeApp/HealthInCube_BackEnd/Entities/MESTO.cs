
namespace HealthInCubeModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class MESTO
    {
        public MESTO()
        {
            this.BYDLISKA = new HashSet<BYDLISKO>();
            this.NEMOCNICE = new HashSet<NEMOCNICA>();
            this.ZDRAVOTNA_KARTA = new HashSet<ZDRAVOTNA_KARTA>();
        }
    
        public decimal ID_OKRES { get; set; }
        public string NAZOV { get; set; }
        public decimal ID_MESTO { get; set; }
    
        public virtual ICollection<BYDLISKO> BYDLISKA { get; set; }
        public virtual ICollection<NEMOCNICA> NEMOCNICE { get; set; }
        public virtual ICollection<ZDRAVOTNA_KARTA> ZDRAVOTNA_KARTA { get; set; }
        public virtual OKRES OKRES { get; set; }
    }
}
