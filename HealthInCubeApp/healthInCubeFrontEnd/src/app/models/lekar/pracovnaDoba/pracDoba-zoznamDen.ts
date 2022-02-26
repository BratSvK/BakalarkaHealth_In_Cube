export interface ZoznamDenModel {
    idDen: number;
    nazov: string;
}

export class ZoznamDen implements ZoznamDenModel {
    
    constructor(public idDen: number, public nazov: string) {
    }

}