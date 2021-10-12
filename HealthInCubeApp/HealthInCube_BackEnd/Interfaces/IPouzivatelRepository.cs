using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface IPouzivatelRepository : IRepository<Pouzivatel,RegisterPouzivatelDto>
    {
         
        // Task<IEnumerable<RolaDTO>> GetAllRoles();

    }
}