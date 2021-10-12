using Microsoft.AspNetCore.Identity;

namespace HealthInCube_BackEnd.Entities
{

    // this is join table for M:N pouzivatel <-> Rola
    public class AppPouzivatelRola : IdentityUserRole<decimal>
    {
        public Pouzivatel Pouzivatel { get; set; }
        public AppRola PouzivatelRola { get; set; }
    }
}