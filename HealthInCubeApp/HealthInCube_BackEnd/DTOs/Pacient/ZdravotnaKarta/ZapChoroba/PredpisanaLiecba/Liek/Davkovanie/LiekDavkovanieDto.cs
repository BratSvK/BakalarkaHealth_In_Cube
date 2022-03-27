namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.PredpisanaLiecba.Liek.Davkovanie
{
    /// <summary>
    /// Number of dosages for medicament.
    /// </summary>
    public class LiekDavkovanieDto
    {
        /// <summary>
        /// Number of dosages per day(M/A/N).
        /// </summary>
        public byte DavkovaniePocet { get; set; }
    }
}
