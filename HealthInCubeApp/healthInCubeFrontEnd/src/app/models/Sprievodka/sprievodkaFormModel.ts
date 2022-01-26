import { SprievodkaModel } from "./sprievodkaModel";

export interface SprievodkaCreateModel extends SprievodkaModel {
    terminDatum: string;
    dlzkaVysetrenia: number;
}

export interface SprievodkaFormModel {
    idPacient?: number;
}