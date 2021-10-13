import { ActionReducerMap } from "@ngrx/store";
import { practitionerInfoReducer } from "../auth/register/practitioner-info/store/practitioner-info.reducer";
import { registerReducer } from "../auth/register/store/register.reducer";
import { AppState } from "./models/AppState";

export const appReducer: ActionReducerMap<AppState> = {
    register: registerReducer,
    practitionerInfo: practitionerInfoReducer

}