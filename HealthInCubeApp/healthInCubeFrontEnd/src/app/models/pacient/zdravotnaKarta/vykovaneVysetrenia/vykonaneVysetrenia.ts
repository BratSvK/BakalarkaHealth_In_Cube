import { Lekar } from "src/app/models/lekar/lekar";
import { ZapChoroby } from "../zapChoroby/zapChoroby";
import { ZdravotnaKarta } from "../zdravotnaKarta";

export interface VykVysetrenia {
    idVysetrenie: number;
    idPacient: number | null;
    idLekar: number | null;
    datumVys: string;
    vysledok: string;
    priloha: string;
    idLekarNavigation: Lekar;
    idPacientNavigation: ZdravotnaKarta;
    // predpLiecbas: PredpLiecba[];
    // recepts: Recept[];
    zapChorobies: ZapChoroby[];
}