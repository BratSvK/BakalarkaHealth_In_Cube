import { Action } from "@ngrx/store";
import { ActivatedPatient } from "src/app/models/pacient/activatedPatient";

export const GET_IS_ACTIVATED = '[Patient] Is activated';
export const SET_IS_ACTIVATED = '[Patient] set is activated';

export const RESET_PATIENT = '[Patient] reset';

export class ResetPatient implements Action {
    readonly type = RESET_PATIENT;
}

export class IsActivated implements Action {
    readonly type = GET_IS_ACTIVATED

    constructor(public payload: number) {}
}


export class SetIstActivated implements Action {
    readonly type = SET_IS_ACTIVATED

    constructor(public payload: ActivatedPatient) {}
}

export type PatientActions = IsActivated | SetIstActivated | ResetPatient;