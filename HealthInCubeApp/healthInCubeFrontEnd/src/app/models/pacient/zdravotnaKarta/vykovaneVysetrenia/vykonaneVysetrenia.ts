import { PredpisanaLiecba } from "./predLiecba";
import { Recept } from "./recept";

export interface VykVysetrenie {
    idVysetrenie: number;
    idPacient: number;
    datumVys: string;
    vysledok: string;
    priloha: string;
    menoVysetrujuciLekar: string;
    typVysetreniaNazov: string;
    predpLiecbas: PredpisanaLiecba[];
    recepts: Recept[];
}