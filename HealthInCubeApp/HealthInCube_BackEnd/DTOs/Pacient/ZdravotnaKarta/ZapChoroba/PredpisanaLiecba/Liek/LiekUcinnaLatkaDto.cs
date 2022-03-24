using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.PredpisanaLiecba.Liek.UcinnaLatka;

namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.PredpisanaLiecba.Liek
{
    /// <summary>
    /// The model for active substance of medicament.
    /// </summary>
    public class LiekUcinnaLatkaDto
    {
        /// <summary>
        /// The active substance reference.
        /// </summary>
        public  UcinnaLatkaDto IdLatkaNavigation { get; set; }
    }
}
