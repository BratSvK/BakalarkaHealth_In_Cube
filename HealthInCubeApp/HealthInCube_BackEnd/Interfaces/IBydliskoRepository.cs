using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Interfaces
{
    /// <summary>
    /// Adresses repository.
    /// </summary>
    public interface IBydliskoRepository : IRepository<Bydlisko,BydliskoDto>
    {
        Task<IEnumerable<BydliskoDto>> GetAllAdressessByUser(decimal userId);

        Task<Bydlisko> GetTrvaleBydliskoAsync(decimal pouizivatelId);

        Task<Bydlisko> GetBydliskoByStreetNameAsync(string streetName, decimal pouzivatelId);
    }
}
