namespace HealthInCube_BackEnd.Helpers.Params
{
    /// <summary>
    /// Base params for pagination model.
    /// </summary>
    public class ParamsBase
    {
        /// <summary>
        /// Page number.
        /// </summary>
        public int PageNumber { get; set; } = 1;

        private const int MaxPageSize = 50;
        private int _pageSize = 10;              

        /// <summary>
        /// Validation for not overflow max page size.
        /// </summary>
        public int PageSize
        {
            get => _pageSize;
            set => _pageSize = (value > MaxPageSize) ? MaxPageSize : value;
        }
    }
}
