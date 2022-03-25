using System.Collections.Generic;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Interfaces.CiselnikHelper
{
    /// <summary>
    /// Helper interface for choroba table.
    /// </summary>
    public interface IChorobaService<T>
    {
        /// <summary>
        /// Search illnes by name.
        /// </summary>
        /// <param name="name">Key word in name of illness.</param>
        Task<IEnumerable<T>> SearchChorobaByNameAsync(string name);
    }
}
