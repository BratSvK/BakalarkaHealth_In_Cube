export const PAGINATION_HEADER_NAME = 'Pagination';

export const DEFUALT_ITEMS_PER_PAGE = 5;
export const DEFUALT_PAGE_NUMBER = 1;

export interface Pagination {
    currentPage: number;
    itemsPerPage: number;
    totalItems: number;
    totalPages: number;
}

export class PaginatedResult<T> {
    result: T;
    pagination: Pagination
}