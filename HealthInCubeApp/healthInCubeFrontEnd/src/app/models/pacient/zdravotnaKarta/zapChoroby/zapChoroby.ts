import { Priznak } from "./priznakChoroba";

export interface ZapChoroba {
    idZdravotnaKarta: number;
    cisChoroba: string;
    idVysetrenie: number;
    od: string;
    do: string | null;
    nazov: string;
    priznakies: Priznak[];
}