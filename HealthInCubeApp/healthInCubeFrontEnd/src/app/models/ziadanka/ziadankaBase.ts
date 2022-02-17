import { Pouzivatel } from "../pouzivatel";

export interface ZiadankaBase {
    idUser: number;
    acceptedAt: string | null;
    createdAt: string;
    pouzivatel: Pouzivatel;
}