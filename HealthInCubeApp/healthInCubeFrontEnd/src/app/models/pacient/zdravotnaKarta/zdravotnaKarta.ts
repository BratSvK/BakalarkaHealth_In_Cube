import { Operation } from "fast-json-patch";
import { PacientZdravotnaKartaDetail } from "../pacientZdravotnaKartaDetail";
import { VykVysetrenie } from "./vykovaneVysetrenia/vykonaneVysetrenia";
import { ZapChoroba } from "./zapChoroby/zapChoroby";

export interface ZdravotnaKarta {
    pacientDetail: PacientZdravotnaKartaDetail
    vykVysetrenia: VykVysetrenie[];
    zapChorobies: ZapChoroba[];
}

export interface ZdravotnaKartaPatchModel {
    patchModel: Operation[];
}