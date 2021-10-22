import { Action } from "@ngrx/store";

export const GET_IS_ACTIVATED = '[Patient] Is activated';


export const SET_IS_ACTIVATED = '[Patient] set is activated';




export class IsActivated implements Action {
    readonly type = GET_IS_ACTIVATED

    constructor(public payload: number) {}
}


export class SetIstActivated implements Action {
    readonly type = SET_IS_ACTIVATED

    constructor(public payload: boolean) {}
}



export type PatientActions = IsActivated | SetIstActivated;