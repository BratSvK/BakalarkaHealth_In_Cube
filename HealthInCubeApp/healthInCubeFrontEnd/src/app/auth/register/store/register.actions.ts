import { Action } from "@ngrx/store";
import { Mesto } from "src/app/models/mesto";
import { Okres } from "src/app/models/okres";
import { Rola } from "src/app/models/rola";

export const FETCH_OKRESY = '[Register] Fetch okresy'; // async
export const SET_OKRESY = '[Register] Set okresy';        // sync

export const FETCH_MESTA = '[Register] Fetch mesta';
export const SET_MESTA = '[Register] Set mesta';





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





export type RegisterActions =
  | FetchOkresy
  | SetOkresy
  | FetchMesta
  | SetMesta;
 





