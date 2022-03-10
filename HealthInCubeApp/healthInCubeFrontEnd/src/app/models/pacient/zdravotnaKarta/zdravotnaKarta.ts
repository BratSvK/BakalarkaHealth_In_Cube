import { Mesto } from "../../mesto";
import { PouzivatelZdravotnaKarta } from "../../pouzivatel/pouzivatelZdravotnaKarta";
import { VykVysetrenia } from "./vykovaneVysetrenia/vykonaneVysetrenia";
import { ZapChoroby } from "./zapChoroby/zapChoroby";

export interface ZdravotnaKarta {
    idPacient: number;
    krvSkupina?: string;
    pouzivatel: PouzivatelZdravotnaKarta
    miestoNarodenia: Mesto;
    vykVysetrenia: VykVysetrenia[];
    zapChorobies: ZapChoroby[];
}