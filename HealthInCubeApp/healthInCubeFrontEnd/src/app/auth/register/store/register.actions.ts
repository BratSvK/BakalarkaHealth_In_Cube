import { Action } from "@ngrx/store";
import { Mesto } from "src/app/models/mesto";
import { Okres } from "src/app/models/okres";
import { Lekar } from "src/app/models/lekar";

export const FETCH_OKRESY = '[Register] Fetch okresy'; // async
export const SET_OKRESY = '[Register] Set okresy';        // sync

export const FETCH_MESTA = '[Register] Fetch mesta';
export const SET_MESTA = '[Register] Set mesta';


export const FETCH_PRACTITIONERS = '[Register] Fetch practitioners';
export const SET_PRACTITIONERS = '[Register] Set practitioners';





export class FetchOkresy implements Action {
    readonly type = FETCH_OKRESY;

    

}


export class SetOkresy implements Action {
    readonly type = SET_OKRESY;

    constructor(public payload: Okres[]) {}

}



export class FetchMesta implements Action {
    readonly type = FETCH_MESTA;
    
    constructor(public payload: number) {}

}


export class SetMesta implements Action {
    readonly type = SET_MESTA;

    constructor(public payload: Mesto[]) {}

}



export class FetchPractitioners implements Action {
    readonly type = FETCH_PRACTITIONERS;
    
    constructor(public payload: { idMesto: number, vek: number}) {}

}


export class SetPractitioners implements Action {
    readonly type = SET_PRACTITIONERS;

    constructor(public payload: Lekar[]) {}

}





export type RegisterActions =
  | FetchOkresy
  | SetOkresy
  | FetchMesta
  | SetMesta
  | FetchPractitioners
  | SetPractitioners;
 





