namespace HealthInCube_BackEnd.Helpers
{
    /// <summary>
    /// Params from lekar.
    /// </summary>
    public class LekarParams
    {
        /// <summary>
        /// Page number.
        /// </summary>
        public int PageNumber { get; set; } = 1;

        private const int MaxPageSize = 50;
        private int _pageSize = 10;                 // set it by default 

        /// <summary>
        /// Validation for not overflow max page size.
        /// </summary>
        public int PageSize
        {
            get => _pageSize;
            set => _pageSize = (value > MaxPageSize) ? MaxPageSize : value;
        }

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
