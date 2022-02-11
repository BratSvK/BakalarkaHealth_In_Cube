import { Mesto } from "../../mesto";
import { VykVysetrenia } from "./vykovaneVysetrenia/vykonaneVysetrenia";
import { ZapChoroby } from "./zapChoroby/zapChoroby";

export interface ZdravotnaKarta {
    idPacient: number;
    krvSkupina: string;
    miestoNarodenia: Mesto;
    vykVysetrenia: VykVysetrenia[];
    zapChorobies: ZapChoroby[];
}