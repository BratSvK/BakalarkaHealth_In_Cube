import { Action } from "@ngrx/store";
import { Lekar } from "src/app/models/lekar";
import { Ziadanka } from "src/app/models/ziadanka";

export const FETCH_REQUESTS = '[Lekar] Fetch requests';     // async
export const SET_REQUESTS = '[Lekar] Set requests';         // sync

export const FETCH_LEKAR_ID = '[Lekar] Fetch Lekar Id';     // async
export const SET_LEKAR_ID = '[Lekar] Set Lekar Id';

export const FETCH_PRACTITIONER = '[Lekar] Fetch practitioner';
export const SET_PRACTITIONER = '[Lekar] Set practitioner';




export class SetLekarId implements Action {
    readonly type = SET_LEKAR_ID;

    constructor(public payload: number) {}
}

export class FetchRequests implements Action {
    readonly type = FETCH_REQUESTS;
    
    constructor() {}
}


export class SetRequests implements Action {
    readonly type = SET_REQUESTS;

    constructor(public payload: Ziadanka[]) {}

}


export class FetchPractitioner implements Action {
    readonly type = FETCH_PRACTITIONER;
    
    constructor() {}

}


export class SetPractitioner implements Action {
    readonly type = SET_PRACTITIONER;

    constructor(public payload: Lekar) {}

}


export type LekarActions = 
    | FetchRequests
    | SetRequests
    | SetLekarId
    | FetchPractitioner
    | SetPractitioner;
    
