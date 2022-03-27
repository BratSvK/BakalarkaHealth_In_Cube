using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.PredpisanaLiecba.Liek.Balenie;
using System;

namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.Recept
{
    /// <summary>
    /// The model represented medicament receipt.
    /// </summary>
    public class ReceptDto
    {
        
        /// <summary>
        /// The id of the examnation.
        /// </summary>
        public decimal IdVysetrenie { get; set; }

        /// <summary>
        /// Id of the medicament.
        /// </summary>
        public decimal? IdLiek { get; set; }

        /// <summary>
        /// Id of the medicament in package.
        /// </summary>
        public string IdBalenie { get; set; }
        /// <summary>
        /// Package(ks.).
        /// </summary>
        public byte BalenieKs { get; set; }
        public DateTime Vystavenie { get; set; } = DateTime.UtcNow;

        /// <summary>
        /// The total price of the receipt.
        /// </summary>
        public decimal? Cena { get; set; }

        /// <summary>
        /// Date of the taken.
        /// </summary>
        public DateTime? Vybranie { get; set; }

        /// <summary>
        /// The doctor of examination.
        /// </summary>
        public string OsetrujuciLekar { get; set; }

        /// <summary>
        /// Package with medicaments of examinations result.
        /// </summary>
        public BalenieDto IdBalenenieNavigation { get; set; }
    }
}
