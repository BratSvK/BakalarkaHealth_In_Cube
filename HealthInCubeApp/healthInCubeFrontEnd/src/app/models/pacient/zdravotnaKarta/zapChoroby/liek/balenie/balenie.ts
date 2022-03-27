import { LiekRecep } from "../liekRecept";

export interface Balenie {
    kodBalenia: string;
    sposobUhrady: string;
    cena: number;
    doplatok: number;
    pocetKs: number;
    idLiekNavigation: LiekRecep;
}


export interface BalenieCacheModel {
    kodBalenia: string;
    pocetKs: number;
}

export class BalenieBuilder implements BalenieCacheModel {
    
    constructor(public kodBalenia: string, public pocetKs: number) {
    }

}