

namespace HealthInCubeModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class CHOROBA 
    {
        public CHOROBA()
        {
            this.ZAP_CHOROBY = new HashSet<ZAP_CHOROBY>();
        }
    
        public string CIS_CHOROBA { get; set; }
        public string NAZOV { get; set; }
        public string SK_OCHORENI { get; set; }
        public Nullable<short> OBM_VEK_OD { get; set; }
        public Nullable<short> OBM_VEK_DO { get; set; }
        public string OBM_POHLAVIE { get; set; }
        public System.DateTime VALID_OD { get; set; }
        public Nullable<System.DateTime> VALID_DO { get; set; }
        public string DOPL_INFO_PATRI { get; set; }
        public string DOPL_INFO_NEPATRI { get; set; }
    
        public virtual ICollection<ZAP_CHOROBY> ZAP_CHOROBY { get; set; }
    }
}
