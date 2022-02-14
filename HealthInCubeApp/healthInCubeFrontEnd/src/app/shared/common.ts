export function extractKeyFromParams(params: any): string {
    return Object.values(params).join('-');
}

export const notNull = (data) => data !== null;

export const notUndefined = (data) => data !== undefined;

