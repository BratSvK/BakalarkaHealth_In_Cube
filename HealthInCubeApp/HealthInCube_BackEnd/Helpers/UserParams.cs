namespace HealthInCube_BackEnd.Helpers
{
    /// <summary>
    /// Params from user.
    /// </summary>
    public class UserParams
    {
        /// <summary>
        /// Page number.
        /// </summary>
        public int PageNumber { get; set; } = 1;
        
        /// <summary>
        /// Validation for not overflow max page size.
        /// </summary>
        public int PageSize
        {
            get => _pageSize;
            set => _pageSize = (value > MaxPageSize) ? MaxPageSize : value;
        }

        private const int MaxPageSize = 50;
        private int _pageSize = 10;     // set it by default 
    }
}
