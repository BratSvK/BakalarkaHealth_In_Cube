import { Action } from "@ngrx/store";
import { Mesto } from "src/app/models/mesto";
import { Okres } from "src/app/models/okres";
import { Rola } from "src/app/models/rola";

export const FETCH_OKRESY = '[Register] Fetch okresy'; // async
export const SET_OKRESY = '[Register] Set okresy';        // sync

export const FETCH_MESTA = '[Register] Fetch mesta';
export const SET_MESTA = '[Register] Set mesta';

export const FETCH_ROLE = '[Register] Fetch role';
export const SET_ROLE = '[Register] Set role';



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




export class FetchRole implements Action {
    readonly type = FETCH_ROLE;

}


export class SetRole implements Action {
    readonly type = SET_ROLE;

    constructor(public payload: Rola[]) {}

}



export type RegisterActions =
  | FetchOkresy
  | SetOkresy
  | FetchMesta
  | SetMesta
  | FetchRole
  | SetRole;






