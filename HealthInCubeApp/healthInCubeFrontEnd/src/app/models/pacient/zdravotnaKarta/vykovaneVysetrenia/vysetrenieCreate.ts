import { ZapChoroba } from "../zapChoroby/zapChoroby";
import { PredpisanaLiecba } from "./predLiecba";
import { Recept } from "./recept";
import { VykVysetrenie } from "./vykonaneVysetrenia";

export interface VysetrenieVysledok extends VykVysetrenie {
    zapChoroba: ZapChoroba;
    predpisanaLiecba: PredpisanaLiecba;
    recept: Recept;
}