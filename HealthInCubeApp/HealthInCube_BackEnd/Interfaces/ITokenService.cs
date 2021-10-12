using System.Threading.Tasks;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface ITokenService
    {
        Task<string> CreateToken(Pouzivatel user);
         
    }
}