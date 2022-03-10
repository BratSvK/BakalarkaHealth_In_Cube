namespace HealthInCube_BackEnd.DTOs.Pouzivatel
{
    /// <summary>
    /// The user information model to health record to the patient.
    /// </summary>
    public class PouzivatelZdravotnaKartaDto
    {
        /// <summary>
        /// User email.
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// User photo to indentity of patient.
        /// </summary>
        public byte[] Fotka { get; set; }

        /// <summary>
        /// Surname and lastname.
        /// </summary>
        public string FullName { get; set; }
    }
}
