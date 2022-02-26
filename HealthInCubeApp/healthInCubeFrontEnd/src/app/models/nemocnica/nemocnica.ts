import { Oddelenie } from "./oddelenie/oddelenie";

export interface Nemocnica {
    idNem: number;
    nazov: string;
    mobil: string;
    ulica: string;
    urlStranka: string;
    idMesto: number;
    oddelenies: Oddelenie[];
}
