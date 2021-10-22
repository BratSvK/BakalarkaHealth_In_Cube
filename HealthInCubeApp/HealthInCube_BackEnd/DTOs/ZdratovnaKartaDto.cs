using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// Health record DTO.
    /// </summary>
    public class ZdratovnaKartaDto
    {
        /// <summary>
        /// Patient of health records
        /// </summary>
        public decimal IdPacient { get; set; }
        /// <summary>
        /// Blood group.
        /// </summary>
        public string KrvSkupina { get; set; }
        /// <summary>
        /// Place of birth.
        /// </summary>
        public MestoDto MiestoNarodenia { get; set; }
    }
}
