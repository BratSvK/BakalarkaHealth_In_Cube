import { RegisterState } from "src/app/auth/register/store/modelStore/RegisterState";
import { AuthState } from "src/app/auth/store/modelStore/AuthState";
import { PatientState } from "src/app/user/patient/store/modelStore/PatientState";

export interface AppState {
    register: RegisterState,
    auth: AuthState,
    patient: PatientState

}