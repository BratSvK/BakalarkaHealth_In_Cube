import { UserParams } from "./../userParams";

export class ZiadankaParams extends UserParams {    
    
    constructor(public idNemocnica: number) {
        super();

        this.idNemocnica = idNemocnica;
    }

}