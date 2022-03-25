namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.Priznak
{
    /// <summary>
    /// Specific type of symptom.
    /// </summary>
    public class TypPriznakDto
    {
        /// <summary>
        /// Id of the symptom.
        /// </summary>
        public decimal IdSymptom { get; set; }

        /// <summary>
        /// Name of the symptom.
        /// </summary>
        public string Nazov { get; set; }
    }
}
