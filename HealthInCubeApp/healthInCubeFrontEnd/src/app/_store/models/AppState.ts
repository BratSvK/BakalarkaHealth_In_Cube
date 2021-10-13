import { PractitionerInfoState } from "src/app/auth/register/practitioner-info/store/modelStore/PractiotionerInfoState";
import { RegisterState } from "src/app/auth/register/store/modelStore/RegisterState";

export interface AppState {
    register: RegisterState,
    practitionerInfo: PractitionerInfoState
}