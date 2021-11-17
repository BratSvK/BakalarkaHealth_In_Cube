import { Bydlisko } from "./bydlisko";

export interface PouzivatelDetail {
    id: number;
    registrovany: string;
    datNarodenia?: Date;
    poslednePrihlasenie?: Date;
    bydliskos: Bydlisko[];
}