using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface IPouzivatelRepository : IRepository<Pouzivatel,RegisterPouzivatelDto>
    {
         
        Task<Pouzivatel> GetPouzivatelEntity(decimal pouzivatelId);

        Task<Pouzivatel> GetPouzivatelWithRequests(decimal pouzivatelId);

        Task<ICollection<BydliskoDto>> GetBydliskaAsync(decimal pouzivatelId);

        Task<int> GetCountNumber();

        Task<BydliskoDto> GetTrvaleBydlisko(decimal pouzivatelId);

        Task<string> GetTrvaleMesto(decimal pouzivatelId);

    }
}