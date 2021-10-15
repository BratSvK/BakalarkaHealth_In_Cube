export interface RegisterPouzivatel {
    meno: string;
    priezvisko: string;
    rodPriezvisko: string;
    rodCislo: string;
    datNarodenia: string | null;
    email: string;
    mobil: string;
    pohlavie: string;
    password: string;
    idDoctor: number;
    country: string;
    district: string;
    city: string;
    street: string;
    isPernamentAddress: boolean;
}