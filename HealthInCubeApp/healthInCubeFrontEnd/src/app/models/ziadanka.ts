import { User } from "./user";

export interface Ziadanka {
    idUser: number;
    idLekar: number;
    acceptedAt: string | null;
    createdAt: string;
    pouzivatel: User;
}