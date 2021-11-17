using System.Collections.Generic;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface IRepository<T,U>
    {
        Task<IEnumerable<U>> GetItemsAsync();

        Task<U> GetItemAsync(decimal itemId);

        Task<bool> EntityExists(decimal itemId);

        void InsertItem(T item);

        void DeleteItem(T item);

        void UpdateItem(T item);

        Task<bool> SaveAllAsync();
         
    }
}