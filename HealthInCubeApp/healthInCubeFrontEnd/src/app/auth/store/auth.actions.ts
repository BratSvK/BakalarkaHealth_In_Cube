import { Action } from "@ngrx/store";
import { Pouzivatel } from "src/app/models/pouzivatel";
import { PrihlaseniePouzivatel } from "src/app/models/prihlaseniePouzivatel";


export const LOGIN = '[Auth] Login';
export const LOGOUT = '[Auth] Logout';


// send a http request to server 
export const LOGIN_START = '[Auth] Login Start';
export const LOGIN_FAIL = '[Auth] Login Fail';

export const CLEAR_ERROR = '[Auth] Clear Error';
export const AUTO_LOGIN = '[Auth] Auto Login';



export class AuthentificateSuccess implements Action {
    readonly type = LOGIN;


    constructor(public payload: Pouzivatel) {}
}


export class Logout implements Action {
    readonly type = LOGOUT;
    // user = null 
}

export class LoginStart implements Action {
    readonly type = LOGIN_START;
    // for loggin email and password 
    constructor(public payload: PrihlaseniePouzivatel) {}
}


export class LoginFail implements Action {
    readonly type = LOGIN_FAIL;
    // error message 
    constructor(public payload: string) {}
}


export class AutoLogin implements Action {
    readonly type = AUTO_LOGIN;
}


export class ClearError implements Action {
    readonly type = CLEAR_ERROR;

    constructor() {}
}



export type AuthActions =
  | AuthentificateSuccess
  | Logout
  | LoginStart
  | LoginFail
  | ClearError
  | AutoLogin;


