using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta
{
    /// <summary>
    /// Model for updating health record for patient.
    /// </summary>
    public class ZdravotnaKartaUpdateDto
    {
        /// <summary>
        /// Blooth group.
        /// </summary>
        public string KrvSkupina { get; set; }
    }
}
