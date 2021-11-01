import { User } from "./user";

export interface Ziadanka {
    idPacient: number;
    idLekar: number;
    acceptedAt: string | null;
    createdAt: string;
    pouzivatel: User;
}