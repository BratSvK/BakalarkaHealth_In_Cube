namespace HealthInCube_BackEnd.DTOs.Pacient
{
    /// <summary>
    /// Patient for modal search in sprievodka.
    /// </summary>
    public class PacientSearchDto
    {
        public decimal IdPacient { get; set; }

        public string Name { get; set; }
    }
}
