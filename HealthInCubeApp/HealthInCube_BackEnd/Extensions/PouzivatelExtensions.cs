using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.Extensions
{
    public static class PouzivatelExtensions
    {
        public static string GetFullName(this Pouzivatel pouzivatel)
        {
        
            return $"{pouzivatel.Meno.Trim()} {pouzivatel.Priezvisko}";
        }
    }
}