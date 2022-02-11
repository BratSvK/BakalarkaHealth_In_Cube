import { VykVysetrenia } from "../vykovaneVysetrenia/vykonaneVysetrenia";
import { ZdravotnaKarta } from "../zdravotnaKarta";

export interface ZapChoroby {
    idZdravotnaKarta: number;
    cisChoroba: string;
    od: string;
    idVysetrenie: number;
    do: string | null;
    // cisChorobaNavigation: Choroba;
    idVysetrenieNavigation: VykVysetrenia;
    idZdravotnaKartaNavigation: ZdravotnaKarta;
    // priznakies: Priznaky[];
}