namespace HealthInCube_BackEnd.DTOs.Lekar
{
    /// <summary>
    /// The Model represented in health record as general practiotioner.
    /// </summary>
    public class GeneralPractitionerDto
    {
        /// <summary>
        /// Phone number.
        /// </summary>
        public string Mobil { get; set; }

        /// <summary>
        /// Email contact.
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// Full name of the doctor.
        /// </summary>
        public string Meno { get; set; }

        /// <summary>
        /// Photo of doctor.
        /// </summary>
        public byte[] Fotka { get; set; }
    }
}
