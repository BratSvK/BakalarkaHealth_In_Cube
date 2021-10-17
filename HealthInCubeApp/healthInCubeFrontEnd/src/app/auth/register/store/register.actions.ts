import { Action, createSelector } from "@ngrx/store";
import { Mesto } from "src/app/models/mesto";
import { Okres } from "src/app/models/okres";
import { Lekar } from "src/app/models/lekar";
import { AppState } from "src/app/_store/models/AppState";
import { RegisterState } from "./modelStore/RegisterState";
import { Pouzivatel } from "src/app/models/pouzivatel";
import { RegisterPouzivatel } from "src/app/models/pouzivatelRegistracia";



export const selectRegister = (state: AppState) => state.register;

export const selectRegisterPractitioners = createSelector(
    selectRegister,
    (state: RegisterState) => state.practitioners
);



export const FETCH_OKRESY = '[Register] Fetch okresy'; // async
export const SET_OKRESY = '[Register] Set okresy';        // sync

export const FETCH_MESTA = '[Register] Fetch mesta';
export const SET_MESTA = '[Register] Set mesta';


export const FETCH_PRACTITIONERS = '[Register] Fetch practitioners';
export const SET_PRACTITIONERS = '[Register] Set practitioners';


export const REGISTER_START = '[Register] Register Start User';

export const REGISTER_SUCCESS = '[Register] Register Success User';

export const REGISTER_FAILED = '[Register] Register Failed User';




export const RESET_FORM = '[Register] Reset form';


export class ResetForm implements Action {
    readonly type = RESET_FORM;
}


export class FetchOkresy implements Action {
    readonly type = FETCH_OKRESY;

    

}

export class RegisterUserStart implements Action {
    readonly type =  REGISTER_START;


    constructor(public payload: RegisterPouzivatel) {}
}

export class RegisterUserSuccess implements Action {
    readonly type =  REGISTER_SUCCESS;
}

export class RegisterUserFailed implements Action {
    readonly type =  REGISTER_FAILED;
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
  | SetPractitioners
  | ResetForm
  | RegisterUserStart
  | RegisterUserSuccess
  | RegisterUserFailed;
 





