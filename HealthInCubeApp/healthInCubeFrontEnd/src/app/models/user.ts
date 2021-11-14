
export enum Role {
    Admin = 'Admin',
    Patient = 'Pacient',
    Practitioner = 'Lekar'
};

export interface User {
    userId: number;
    email: string;
    token: string;
    fotka: string;
    fullName: string;
    expirationDateToken: string;
}