using HealthInCube_BackEnd.DTOs.Lekar;

namespace HealthInCube_BackEnd.DTOs.Pacient
{
    /// <summary>
    /// Pacient detail model.
    /// </summary>
    public class PacientZdravotnaKartaDetailDto : PacientCardDto
    {

        /// <summary>
        /// General practitioner by patient.
        /// </summary>
        public GeneralPractitionerDto VseobecnyLekar { get; set; }

        /// <summary>
        /// Blooth group of the patient.
        /// </summary>
#nullable enable
        public string? KrvSkupina { get; set; }
    }
}
