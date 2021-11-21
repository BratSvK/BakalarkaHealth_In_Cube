using System.Collections.Generic;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Interfaces
{
    /// <summary>
    /// Generic base repository.
    /// First is infrastructure entity object.
    /// Seconds is Data transfer object.
    /// </summary>
    /// <typeparam name="I"> Infrastructure entity object.</typeparam>
    /// <typeparam name="D">Data transfer object.</typeparam>
    public interface IRepository<I,D>
    {
        Task<IEnumerable<D>> GetItemsAsync();

        Task<D> GetItemAsync(decimal itemId);

        Task<I> GetOriginItemAsync(decimal itemId);

        Task<bool> EntityExists(decimal itemId);

        Task<int> GetCountAsync();

        void InsertItem(I item);

        void DeleteItem(I item);

        void UpdateItem(I item);

        Task<bool> SaveAllAsync();
    }
}
