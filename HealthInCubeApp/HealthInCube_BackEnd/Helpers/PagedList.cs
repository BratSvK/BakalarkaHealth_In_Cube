using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Helpers
{
    /// <summary>
    /// Generic paged list.
    /// </summary>
    public class PagedList<T> : List<T>
    {
       /// <summary>
       /// Ctor.
       /// </summary>
       /// <param name="items"></param>
       /// <param name="count"></param>
       /// <param name="pageNumber"></param>
       /// <param name="pageSize"></param>
        public PagedList(IEnumerable<T> items, int count, int pageNumber, int pageSize)
        {
            CurrentPage = pageNumber;
            TotalPages = (int) Math.Ceiling(count / (double) pageSize);             // 10 / 5 = 2 pages
            PageSize = pageSize;
            TotalCount = count;

            // access to item in our pageList
            AddRange(items);
        }

        /// <summary>
        /// Current page.
        /// </summary>
        public int CurrentPage { get; set; }

        /// <summary>
        /// Total pages for request.
        /// </summary>
        public int TotalPages { get; set; }

        /// <summary>
        /// Page size. How many records we wanna display.
        /// </summary>
        public int PageSize { get; set; }

        /// <summary>
        /// Total items in query.
        /// </summary>
        public int TotalCount { get; set; }

        /// <summary>
        /// What's is gona to be paged to client.
        /// </summary>
        /// <returns></returns>
        public static async Task<PagedList<T>> CreateAsync(IQueryable<T> source, int pageNumber, int pageSize)
        {
            // db call to get how many items we have.
            var count = await source.CountAsync();
            var items = await source.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToListAsync();
            return new PagedList<T>(items, count, pageNumber, pageSize);
        }
    }
}
