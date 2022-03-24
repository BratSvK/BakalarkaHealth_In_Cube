using HealthInCube_BackEnd.DTOs.Lekar.LekarTyp;

namespace HealthInCube_BackEnd.DTOs.Lekar
{
    /// <summary>
    /// Only names of atestations with ids.
    /// </summary>
    public class LekarTypAtestacieDto
    {
        public LekarTypVysetrenieDto IdTypNavigation { get; set; }
    }
}
