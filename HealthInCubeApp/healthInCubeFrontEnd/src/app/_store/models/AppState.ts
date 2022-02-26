import { createFeatureSelector } from "@ngrx/store";
import { RegisterState } from "src/app/auth/register/store/modelStore/RegisterState";
import { AuthState } from "src/app/auth/store/modelStore/AuthState";
import { LekarState } from "src/app/user/lekar/store/modelStore/LekarState";
import { PatientState } from "src/app/user/patient/store/modelStore/PatientState";
import { UserDetailState } from "src/app/user/user-detail/store/modelStore/UserDetailState";

export interface AppState {
    register: RegisterState,
    auth: AuthState,
    patient: PatientState,
    lekar : LekarState,
    userDetail: UserDetailState
}


export const lekarId = (state: AppState) => state.lekar.practitioner?.idLekar;



 