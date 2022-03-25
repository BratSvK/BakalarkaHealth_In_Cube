namespace HealthInCube_BackEnd.Entities
{
    /// <summary>
    /// Medicament dosages.
    /// </summary>
    public partial class LiekDavkovanie
    {
        /// <summary>
        /// Id of medicament
        /// </summary>
        public decimal IdLiek { get; set; }

        /// <summary>
        /// Number of dosages per day(M/A/N).
        /// </summary>
        public byte DavkovaniePocet { get; set; }

        public virtual Liek IdLiekNavigation { get; set; }

    }
}
