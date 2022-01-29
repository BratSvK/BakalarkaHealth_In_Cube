import { UserParams } from "./../userParams";

export class LekarParams extends UserParams {
    ageFrom: number = 21;
    ageTo: number = 40;
    bid: string;
    lastName: string;

    constructor() {
        super();
    }

}
