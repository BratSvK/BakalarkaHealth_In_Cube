import { Liek } from "../zapChoroby/liek/liek";

export interface PredpisanaLiecba {
    idVysetrenie: number;
    od: string;
    davkovaniePocet: number;
    do: string | null;
    idLiekNavigation: Liek;
}
