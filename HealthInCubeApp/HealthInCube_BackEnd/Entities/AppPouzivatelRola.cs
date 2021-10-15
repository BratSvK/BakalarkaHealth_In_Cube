using Microsoft.AspNetCore.Identity;

namespace HealthInCube_BackEnd.Entities
{

    // this is join table for M:N pouzivatel <-> Rola
    public class AppPouzivatelRola : IdentityUserRole<decimal>
    {
        public virtual Pouzivatel Pouzivatel { get; set; }
        public virtual AppRola PouzivatelRola { get; set; }
    }
}