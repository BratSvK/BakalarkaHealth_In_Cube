import { LekarSprievodka } from "../lekar/lekarSprievodka";
import { LekarTyp } from "../lekar/typLekar";
import { SprievodkaPacient } from "../pacient/pacientSprievodka";

export interface SprievodkaModel {
    idTypLekarNavigation: LekarTyp;
    terminOd: string;
    terminDo: string;
}

export interface SprievodkaPacientModel extends SprievodkaModel {
    idLekarNavigation : LekarSprievodka;
}

export interface SprievodkaLekarModel extends SprievodkaModel {
    idPacientNavigation : SprievodkaPacient;
}