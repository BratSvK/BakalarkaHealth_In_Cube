
export enum Role {
    Admin = 'Spravca',
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