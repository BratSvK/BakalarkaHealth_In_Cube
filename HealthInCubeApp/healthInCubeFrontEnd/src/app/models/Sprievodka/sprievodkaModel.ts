import { TypyLekara } from "../lekar/lekar";

export interface SprievodkaModel {
    idPacient: number;
    idLekar: number;
    idTypVysetrenia: TypyLekara;
    terminOd: string;
    terminDo: string;
}