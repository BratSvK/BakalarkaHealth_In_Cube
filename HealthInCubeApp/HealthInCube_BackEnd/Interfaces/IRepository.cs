using System.Collections.Generic;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface IRepository<T,U>
    {
        Task<IEnumerable<U>> GetItemsAsync();

        Task<U> GetItemAsync(decimal itemId);

        Task<T> InsertItem(T item);

        Task<bool> DeleteItem(decimal itemId);

        void UpdateItem(T item);

        Task<bool> SaveAllAsync();
         
    }
}