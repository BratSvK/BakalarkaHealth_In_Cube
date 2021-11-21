import { Mesto } from "./mesto";

export interface Bydlisko {
    idBydliska?: number;
    idPouzivatel?: number | null;
    ulica: string;
    adresaOd?: string;
    adresaDo?: string | null;
    trvale: boolean;
    idMestoNavigation?: Mesto;
}