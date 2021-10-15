import { ActionReducerMap } from "@ngrx/store";
import { registerReducer } from "../auth/register/store/register.reducer";
import { authReducer } from "../auth/store/aut.reducer";
import { AppState } from "./models/AppState";

export const appReducer: ActionReducerMap<AppState> = {
    register: registerReducer,
    auth: authReducer

}