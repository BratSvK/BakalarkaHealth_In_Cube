import { RegisterState } from "src/app/auth/register/store/modelStore/RegisterState";
import { AuthState } from "src/app/auth/store/modelStore/AuthState";

export interface AppState {
    register: RegisterState,
    auth: AuthState

}