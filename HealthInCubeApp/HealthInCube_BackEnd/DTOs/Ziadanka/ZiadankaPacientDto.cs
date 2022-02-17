namespace HealthInCube_BackEnd.DTOs.Ziadanka
{
    /// <summary>
    /// Extended model for request patient.
    /// </summary>
    public class ZiadankaPacientDto : ZiadankaBaseDto
    {
        /// <summary>
        /// Id of the doctor.
        /// </summary>
        public decimal IdLekar { get; set; }
    }
}
