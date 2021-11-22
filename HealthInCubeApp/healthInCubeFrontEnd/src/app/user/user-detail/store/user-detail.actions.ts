import { Action } from '@ngrx/store';
import { Bydlisko } from 'src/app/models/bydlisko';
import { CreateBydlisko } from 'src/app/models/createBydlisko';
import { Mesto } from 'src/app/models/mesto';
import { PouzivatelDetail } from 'src/app/models/pouzivatel-detail';

export const FET_USER_DETAIL = '[User-Detail] Fetch user detail';
export const SET_USER_DETAIL = '[User-Detail] set user detail';
export const RESET_USER_DETAIL = '[User-Detail] reset user detail';

export const ADD_BYDLISKO = '[User-Detail]  Add bydlisko';
export const UPDATE_BYDLISKO = '[User-Detail]  Update bydlisko';
export const START_EDIT = '[User-Detail]  Start Edit';
export const STOP_EDIT = '[User-Detail]  Stop Edit';

export const DUMMY = '[User-Detail]  Dummy';



export const FETCH_ALL_MESTA = '[User-Detail] Fetch mesta';
export const SET_ALL_MESTA = '[User-Detail] Set mesta';

export class AddBydlisko implements Action {
  // never be change from outside -> type safty
  readonly type = ADD_BYDLISKO;
  // what we wanna to change
  // trick with proiperty in constructor
  constructor(public payload: Bydlisko) {}
}

export class Dummy implements Action {
  readonly type = DUMMY;
}



export class FetchMestaAll implements Action {
  readonly type = FETCH_ALL_MESTA;
  
  constructor(public payload: number) {}

}

export class SetMestaAll implements Action {
  readonly type = SET_ALL_MESTA;

  constructor(public payload: Mesto[]) {}

}

export class UpdateBydlisko implements Action {
  // never be change from outside -> type safty
  readonly type = UPDATE_BYDLISKO;
  // what we wanna to change
  // trick with proiperty in constructor
  constructor(public payload: CreateBydlisko) {}
}

export class StartEdit implements Action {
  readonly type = START_EDIT;

  constructor(public payload: number) {}
}

export class StopEdit implements Action {
  readonly type = STOP_EDIT;
}

export class ResetUserDetail implements Action {
  readonly type = RESET_USER_DETAIL;
}

export class FetchUserDetail implements Action {
  readonly type = FET_USER_DETAIL;
}

export class SetUserDetail implements Action {
  readonly type = SET_USER_DETAIL;

  constructor(public payload: PouzivatelDetail) {}
}

export type UserDetailActions =
  | SetUserDetail
  | FetchUserDetail
  | ResetUserDetail
  | AddBydlisko
  | UpdateBydlisko
  | StartEdit
  | StopEdit
  | FetchMestaAll
  | SetMestaAll
  | Dummy;
