namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba
{
    /// <summary>
    /// Model of illness.
    /// </summary>
    public class ChorobaDto
    {
        /// <summary>
        /// Unique number of illness.
        /// </summary>
        public string CisChoroba { get; set; }

        /// <summary>
        /// Name of the illness.
        /// </summary>
        public string Nazov { get; set; }
    }
}
