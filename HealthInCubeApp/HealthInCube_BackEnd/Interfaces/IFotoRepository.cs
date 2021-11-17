using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface IFotoRepository : IRepository<FotkaPouzivatel, FotkaDto>
    {

        Task<FotkaDto> GetFotkaByUserId(decimal userId);

    }
}