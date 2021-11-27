using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// Create patient account data transfer object.
    /// </summary>
    public class CreatePatientAccountDto
    {
        public decimal IdUser { get; set; }

        public decimal IdLekar { get; set; }
    }
}
