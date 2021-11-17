import { Action } from "@ngrx/store";
import { PouzivatelDetail } from "src/app/models/pouzivatel-detail";

export const FET_USER_DETAIL = '[User-Detail] Fetch user detail';
export const SET_USER_DETAIL = '[User-Detail] set user detail';

export const RESET_USER_DETAIL = '[User-Detail] reset user detail';

export class ResetUserDetail implements Action {
    readonly type = RESET_USER_DETAIL;
}

export class FetchUserDetail implements Action {
    readonly type = FET_USER_DETAIL
}


export class SetUserDetail implements Action {
    readonly type = SET_USER_DETAIL

    constructor(public payload: PouzivatelDetail) {}
}

export type UserDetailActions = SetUserDetail | FetchUserDetail | ResetUserDetail;