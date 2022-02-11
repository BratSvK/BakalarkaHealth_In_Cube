using HealthInCube_BackEnd.DTOs.Lekar;
using HealthInCube_BackEnd.DTOs.Sprievodka;

namespace HealthInCube_BackEnd.DTOs.Pacient
{
    /// <summary>
    /// Sprievodka for patient to view.
    /// </summary>
    public class SprievodkaPacientDto : SprievodkaDto
    {
        ///// <summary>
        ///// Where is patient going.
        ///// </summary>
        public LekarSprievodkaDto IdLekarNavigation { get; set; }
    }
}
