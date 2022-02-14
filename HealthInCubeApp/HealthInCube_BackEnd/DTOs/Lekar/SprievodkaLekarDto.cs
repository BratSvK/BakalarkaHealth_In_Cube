using HealthInCube_BackEnd.DTOs.Sprievodka;

namespace HealthInCube_BackEnd.DTOs.Lekar
{
    /// <summary>
    /// Sprievodka for doctor view.
    /// </summary>
    public class SprievodkaLekarDto : SprievodkaDto
    {
        ///// <summary>
        ///// For who is invitation.
        ///// </summary>
        public PacientDto IdPacientNavigation { get; set; }
    }
}
