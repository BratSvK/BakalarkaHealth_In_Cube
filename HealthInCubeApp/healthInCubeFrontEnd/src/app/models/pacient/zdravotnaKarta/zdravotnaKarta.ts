import { Operation } from "fast-json-patch";
import { PacientZdravotnaKartaDetail } from "../pacientZdravotnaKartaDetail";
import { VykVysetrenia } from "./vykovaneVysetrenia/vykonaneVysetrenia";
import { ZapChoroby } from "./zapChoroby/zapChoroby";

export interface ZdravotnaKarta {
    pacientDetail: PacientZdravotnaKartaDetail
    vykVysetrenia: VykVysetrenia[];
    zapChorobies: ZapChoroby[];
}


export interface ZdravotnaKartaPatchModel {
    patchModel: Operation[];
}