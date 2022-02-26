import { Action } from "@ngrx/store";
import { CreatePatient } from "src/app/models/createPatient";
import { Lekar } from "src/app/models/lekar/lekar";
import { ZiadankaPacient } from "src/app/models/ziadanka/ziadankaPacient";

export const FETCH_REQUESTS = '[Lekar] Fetch requests';                     // async
export const SET_REQUESTS = '[Lekar] Set requests';                         // sync

export const FETCH_LEKAR_ID = '[Lekar] Fetch Lekar Id';                     // async
export const SET_LEKAR_ID = '[Lekar] Set Lekar Id';

export const FETCH_PRACTITIONER = '[Lekar] Fetch practitioner';
export const SET_PRACTITIONER = '[Lekar] Set practitioner';

export const ACCEPT_REQUEST = '[Lekar] Accept request and create patient';
export const DELETE_REQUEST = '[Lekar] Delete request of user to patient';

export const RESET_PRACTITIONER = '[Lekar] Reset practitioner';

export class DeleteRequest implements Action {
    readonly type = DELETE_REQUEST;

    constructor(public payload: ZiadankaPacient) {}
}

export class ResetPractitioner implements Action {
    readonly type = RESET_PRACTITIONER;

    constructor() {}
}

export class AcceptRequest implements Action {
    readonly type = ACCEPT_REQUEST;

    constructor(public payload: CreatePatient) {}
}

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

    constructor(public payload: ZiadankaPacient[]) {}

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
    | SetPractitioner
    | AcceptRequest
    | DeleteRequest
    | ResetPractitioner;
    