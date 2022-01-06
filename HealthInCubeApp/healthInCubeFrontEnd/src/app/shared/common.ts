export function extractKeyFromParams(params: any): string {
    return Object.values(params).join('-');
}
