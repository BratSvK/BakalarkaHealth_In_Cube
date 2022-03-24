namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.PredpisanaLiecba.Liek.Balenie
{
    /// <summary>
    /// Model represented package of medicaments.
    /// </summary>
    public class BalenieDto
    {
        /// <summary>
        /// Unique number of package.
        /// </summary>
        public string KodBalenia { get; set; }

        /// <summary>
        /// Type of payment
        /// </summary>
        public string SposobUhrady { get; set; }

        /// <summary>
        /// Price the package.
        /// </summary>
        public decimal Cena { get; set; }

        /// <summary>
        /// Price needs to be pay by patient alone.
        /// </summary>
        public decimal Doplatok { get; set; }

        /// <summary>
        /// Number of medicaments in package.
        /// </summary>
        public byte PocetKs { get; set; }

        /// <inheritdoc/>
        public LiekReceptDto IdLiekNavigation { get; set; }
    }
}
