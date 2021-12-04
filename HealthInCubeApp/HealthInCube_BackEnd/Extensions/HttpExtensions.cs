using HealthInCube_BackEnd.Helpers;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Extensions
{
    /// <summary>
    /// Class for add pagination to header.
    /// </summary>
    public static class HttpExtensions
    {
        /// <summary>
        /// Adding pagination header to response.
        /// </summary>
        public static void AddPaginationHeader(this HttpResponse response, int currentPage, int itemsPerPage, int totalItems, int totalPages)
        {
            var paginationHeader = new PaginationHeader(currentPage, itemsPerPage, totalItems, totalPages);

            var options = new JsonSerializerOptions
            {
                PropertyNamingPolicy = JsonNamingPolicy.CamelCase
            };

            response.Headers.Add("Pagination", JsonSerializer.Serialize(paginationHeader, options));
            // Access-Control-Expose-Headers => getResponseHeader() we get information about pagination to client with coma separeted.
            response.Headers.Add("Access-Control-Expose-Headers", "Pagination");
        } 
    }
}
