
using System;
using System.Collections.Generic;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// Pouzivatel detail dto.
    /// </summary>
    public class PouzivatelDetailDto
    {
        public decimal Id { get; set; }

        public DateTime Registrovany { get; set; }

        public DateTime DatNarodenia { get; set; }

        public DateTime PoslednePrihlasenie { get; set; }

        /// <summary>
        /// Zoznam adries pozuivatela.
        /// </summary>
        public ICollection<BydliskoDto> Bydliskos { get; set; }
    }
}
