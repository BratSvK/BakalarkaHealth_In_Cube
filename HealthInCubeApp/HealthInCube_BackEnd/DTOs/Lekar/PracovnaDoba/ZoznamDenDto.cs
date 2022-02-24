namespace HealthInCube_BackEnd.DTOs.Lekar.PracovnaDoba
{
    /// <summary>
    /// Domain model for list of days.
    /// </summary>
    public class ZoznamDenDto
    {
        /// <summary>
        /// Id of day in list.
        /// </summary>
        public int IdDen { get; set; }

        /// <summary>
        /// Name of day.(Pondelok)
        /// </summary>
        public string Nazov { get; set; }
    }
}
