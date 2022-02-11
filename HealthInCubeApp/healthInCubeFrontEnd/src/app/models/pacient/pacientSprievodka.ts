import { Pouzivatel } from "../pouzivatel";
import { SprievodkaModel } from "../sprievodka/sprievodkaModel";
import { ZdravotnaKarta } from "./zdravotnaKarta/zdravotnaKarta";

export interface SprievodkaPacient extends SprievodkaModel {
    idPacient: number;
    idPouzivatel: number;
    idVseobecnyLekar: number;
    od: string;
    do: string | null;
    zdravotnaKartum: ZdravotnaKarta;
    idPouzivatelNavigation: Pouzivatel;
}