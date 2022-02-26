namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// Create patient account data transfer object.
    /// The same as doctor create model.
    /// </summary>
    public class CreatePatientAccountDto
    {
        public decimal IdUser { get; set; }

        public decimal IdLekar { get; set; }
    }
}
