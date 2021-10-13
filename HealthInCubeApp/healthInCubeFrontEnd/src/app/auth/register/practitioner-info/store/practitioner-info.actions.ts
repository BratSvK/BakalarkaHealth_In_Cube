import { Action } from "@ngrx/store";
import { Lekar } from "src/app/models/lekar";

export const FETCH_PRACTITIONER = '[PracitionerInfo] Fetch practitioner';    // async
export const SET_PRACTITIONER = '[PracitionerInfo] Set practitioner';        // sync



export class FetchPractitioner implements Action {
    readonly type = FETCH_PRACTITIONER;

    constructor(public payload: number) {}
}



export class SetPractitioner implements Action {
    readonly type = SET_PRACTITIONER;

    constructor(public payload: Lekar) {}

}


export type RegisterActions =
  | FetchPractitioner
  | SetPractitioner;