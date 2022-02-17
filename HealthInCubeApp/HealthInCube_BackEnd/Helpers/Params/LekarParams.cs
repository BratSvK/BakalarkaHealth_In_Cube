namespace HealthInCube_BackEnd.Helpers.Params
{
    /// <summary>
    /// Params from lekar.
    /// </summary>
    public class LekarParams : ParamsBase
    {
        /// <summary>
        /// Patient age from.
        /// Default value is 21.
        /// </summary>
        public int AgeFrom { get; set; } = 21;

        /// <summary>
        /// Patient age to.
        /// Default value is 40.
        /// </summary>
        public int AgeTo { get; set; } = 40;

        /// <summary>
        /// Birth date code.
        /// Slovak -> Rodné čislo
        /// </summary>
        public string BID { get; set; }

        /// <summary>
        /// Last name of patient.
        /// </summary>
        public string LastName { get; set; }
    }
}
