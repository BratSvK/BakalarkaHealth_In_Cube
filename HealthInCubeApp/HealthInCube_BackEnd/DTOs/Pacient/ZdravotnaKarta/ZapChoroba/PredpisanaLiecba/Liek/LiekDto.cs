namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.PredpisanaLiecba.Liek
{
    /// <summary>
    /// Model represented medicament per threatment.
    /// </summary>
    public class LiekDto
    {
        /// <summary>
        /// Id of the medicament.
        /// </summary>
        public decimal IdLiek { get; set; }
        /// <summary>
        /// Name of the medicament.
        /// </summary>
        public string Nazov { get; set; }

        /// <summary>
        /// Type of medicament.
        /// </summary>
        public string LiekForma { get; set; }
    }
}
