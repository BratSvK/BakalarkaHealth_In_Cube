using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Helpers
{
    /// <summary>
    /// Send information to header with pagination information.
    /// </summary>
    public class PaginationHeader
    {
        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="currentPage"></param>
        /// <param name="itemsPerPage"></param>
        /// <param name="totalItems"></param>
        /// <param name="totalPages"></param>
        public PaginationHeader(int currentPage, int itemsPerPage, int totalItems, int totalPages)
        {
            CurrentPage = currentPage;
            ItemsPerPage = itemsPerPage;
            TotalItems = totalItems;
            TotalPages = totalPages;
        }

        /// <summary>
        /// Current page.
        /// </summary>
        public int CurrentPage { get; set; }

        /// <summary>
        /// Items per page.
        /// </summary>
        public int ItemsPerPage { get; set; }

        /// <summary>
        /// Total items.
        /// </summary>
        public int TotalItems { get; set; }

        /// <summary>
        /// Total pages.
        /// </summary>
        public int TotalPages { get; set; }
    }
}
