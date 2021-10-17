import { Adresa } from "./adresa";

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
    adresa : Adresa;
   
}