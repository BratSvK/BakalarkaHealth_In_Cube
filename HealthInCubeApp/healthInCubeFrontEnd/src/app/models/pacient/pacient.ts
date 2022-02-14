import { Pouzivatel } from "../pouzivatel";
import { ZdravotnePoistenie } from "./poistenie/zdravotnePoistenie";
import { ZdravotnaKarta } from "./zdravotnaKarta/zdravotnaKarta";

export interface Pacient {
    idPacient: number;
    idPouzivatel: number;
    idVseobecnyLekar: number;
    od: string;
    do: string | null;
    zdravotnaKartum: ZdravotnaKarta;
    zdravPoistenies: ZdravotnePoistenie[];
    idPouzivatelNavigation: Pouzivatel;
}