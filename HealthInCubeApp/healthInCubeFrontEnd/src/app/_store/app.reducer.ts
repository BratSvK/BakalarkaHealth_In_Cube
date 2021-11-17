import { ActionReducerMap } from "@ngrx/store";
import { registerReducer } from "../auth/register/store/register.reducer";
import { authReducer } from "../auth/store/auth.reducer";
import { lekarReducer } from "../user/lekar/store/lekar.reducer";
import { patientReducer } from "../user/patient/store/patient.reducer";
import { userDetailReducer } from "../user/user-detail/store/user-detail.reducer";
import { AppState } from "./models/AppState";

export const appReducer: ActionReducerMap<AppState> = {
    register: registerReducer,
    auth: authReducer,
    patient : patientReducer,
    lekar : lekarReducer,
    userDetail: userDetailReducer
}