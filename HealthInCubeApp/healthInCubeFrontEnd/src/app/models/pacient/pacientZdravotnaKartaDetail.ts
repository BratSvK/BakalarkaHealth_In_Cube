import { DoctorHealthRecord } from "../lekar/lekarZdravotnaKarta";
import { PacientCard } from "./pacientCard";

export interface PacientZdravotnaKartaDetail extends PacientCard {
    vseobecnyLekar: DoctorHealthRecord;
    krvSkupina?: string;
}

export enum KrvnaSkupina {
    A_P = 'A+',
    A_M = 'A-',
    AB_P = 'AB+',
    AB_M = 'AB-',
    Z_P = '0+',
    Z_M = '0-',
    B_M = 'B-',
    B_P = 'B+'
}