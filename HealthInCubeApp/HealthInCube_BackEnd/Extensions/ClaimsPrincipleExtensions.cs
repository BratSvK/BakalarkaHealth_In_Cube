using System.Security.Claims;

namespace HealthInCube_BackEnd.Extensions
{
    public static class ClaimsPrincipleExtensions
    {
        public static string GetUserEmail(this ClaimsPrincipal user) => user.FindFirst(ClaimTypes.Name)?.Value;          // unique email inside our token 

        public static int GetUserId(this ClaimsPrincipal user) => int.Parse(user.FindFirst(ClaimTypes.NameIdentifier)?.Value);          // unique id inside our token 
    }
}