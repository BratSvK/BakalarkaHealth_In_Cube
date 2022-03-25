namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.PredpisanaLiecba.Liek.Balenie
{
    /// <summary>
    /// Package for medicament view model.
    /// </summary>
    public class BalenieLiekDto
    {
        /// <summary>
        /// Unique number of package.
        /// </summary>
        public string KodBalenia { get; set; }

        /// <summary>
        /// Number of medicaments in package.
        /// </summary>
        public byte PocetKs { get; set; }

        /// <summary>
        /// Price the package.
        /// </summary>
        public decimal Cena { get; set; }

    }
}
