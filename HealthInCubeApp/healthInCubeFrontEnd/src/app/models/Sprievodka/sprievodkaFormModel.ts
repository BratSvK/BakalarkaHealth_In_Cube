import { SprievodkaModel } from "./sprievodkaModel";

export interface SprievodkaCreateModel extends SprievodkaModel {
    terminDatum: Date;
    dlzkaVysetrenia: number;
}

export interface SprievodkaFormModel {
    idPacient?: number;
}

export class SprievodkaCreateModelApi {
    public constructor(init?: Partial<SprievodkaCreateModel>) {
        Object.assign(this, init);
    }
}
