import { Balenie } from "../zapChoroby/liek/balenie/balenie";

export interface Recept {
    idVysetrenie: number;
    idLiek: number;
    idBalenie: string;
    balenieKs: number;
    vystavenie: string;
    cena: number | null;
    vybranie: string | null;
    osetrujuciLekar: string;
    idBalenenieNavigation: Balenie;

}
