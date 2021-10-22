import { Action } from "@ngrx/store";

export const IS_ACTIVATED = '[Patient] Is activated';


export class IsActivated implements Action {
    readonly type = IS_ACTIVATED

    constructor(public payload: number) {}
}



export type PatientActions = IsActivated;