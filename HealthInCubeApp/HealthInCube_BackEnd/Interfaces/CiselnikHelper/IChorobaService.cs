using System.Collections.Generic;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Interfaces.CiselnikHelper
{
    /// <summary>
    /// Helper interface for choroba table.
    /// </summary>
    public interface IChorobaService<T>
    {
        Task<IEnumerable<T>> SearchChorobaTableByName(string name);
    }
}
