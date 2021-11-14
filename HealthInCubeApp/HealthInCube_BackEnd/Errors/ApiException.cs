namespace HealthInCube_BackEnd.Errors
{
    /// <summary>
    /// Exception for our Server,
    /// </summary>
    public class ApiException
    {
        public ApiException(int statusCode, string message = null, string details = null)
        {
            StatusCode = statusCode;
            Message = message;
            Details = details;
        }

        /// <summary>
        /// Status code from response.
        /// Always to be 500 server.
        /// </summary>
        public int StatusCode { get; set; }

        /// <summary>
        /// Message.
        /// </summary>
        public string Message { get; set; }

        /// <summary>
        /// Stack trace from exception.
        /// </summary>
        public string Details { get; set; }

    }
}
