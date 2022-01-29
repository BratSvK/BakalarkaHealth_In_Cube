import { Action } from "@ngrx/store";
import { Photo } from "src/app/models/photo";
import { Pouzivatel } from "src/app/models/pouzivatel";
import { PrihlaseniePouzivatel } from "src/app/models/prihlaseniePouzivatel";

export const LOGIN = '[Auth] Login';
export const LOGOUT = '[Auth] Logout';

// send a http request to server 
export const LOGIN_START = '[Auth] Login Start';
export const LOGIN_FAIL = '[Auth] Login Fail';

export const CLEAR_ERROR = '[Auth] Clear Error';
export const AUTO_LOGIN = '[Auth] Auto Login';

export const FET_USER_PHOTO = '[Auth] Fetch user photo';
export const SET_USER_PHOTO = '[Auth] Set user photo';
export const REMOVE_USER_PHOTO = '[Auth] Remove User photo';


export class RemoveUserPhoto implements Action {
    readonly type = REMOVE_USER_PHOTO;
  }

export class FetchUserPhoto implements Action {
    readonly type = FET_USER_PHOTO;
}

export class SetUserPhoto implements Action {
    readonly type = SET_USER_PHOTO;

    constructor(public payload: Photo) {}
}

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
  | AutoLogin
  | FetchUserPhoto
  | SetUserPhoto
  | RemoveUserPhoto;


