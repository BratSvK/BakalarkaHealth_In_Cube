export interface Priznak {
    cisChoroba: string;
    idZdravotnaKarta: number;
    idSymptom: number;
    nazov: string;
    od: string;
}

export interface TypPriznak {
    idSymptom: number;
    nazov: string;
}

export class PriznakBuilder implements TypPriznak {
    
    constructor(public idSymptom: number, public nazov: string) {
    }

}