using System.Collections.Generic;

namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.PredpisanaLiecba.Liek
{
    /// <summary>
    /// Model represented by the medicament for recipe.
    /// </summary>
    public class LiekReceptDto : LiekDto
    {
        /// <summary>
        /// List of the active substance of medicament.
        /// </summary>
        public ICollection<LiekUcinnaLatkaDto> LiekUcinnaLatkas { get; set; }
    }
}
