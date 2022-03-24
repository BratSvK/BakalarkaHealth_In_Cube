import { LiekRecep } from "../liekRecept";

export interface Balenie {
    kodBalenia: string;
    sposobUhrady: string;
    cena: number;
    doplatok: number;
    pocetKs: number;
    idLiekNavigation: LiekRecep;
}