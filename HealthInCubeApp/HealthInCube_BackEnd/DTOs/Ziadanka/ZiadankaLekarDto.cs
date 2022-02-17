namespace HealthInCube_BackEnd.DTOs.Ziadanka
{
    /// <summary>
    /// Extended model for request doctor.
    /// </summary>
    public class ZiadankaLekarDto : ZiadankaBaseDto
    {
        /// <summary>
        /// Id of the hospital.
        /// </summary>
        public decimal IdNemocnica { get; set; }
    }
}
