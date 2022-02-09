import { DefaultActivatedPatientModel } from "src/app/models/pacient/activatedPatient";
import { PatientState } from "./modelStore/PatientState";
import * as PatientActionsBundle from './patient.actions';

// only state is a user 
const initialState: PatientState = {
    activatedPatient: new DefaultActivatedPatientModel()
};

export function patientReducer(state: PatientState = initialState, action: PatientActionsBundle.PatientActions) {
    switch (action.type) {
        case PatientActionsBundle.SET_IS_ACTIVATED:
            return {
                ...state,
                activatedPatient: action.payload
            }
        case PatientActionsBundle.RESET_PATIENT:
                return {
                    ...state,
                    activatedPatient: new DefaultActivatedPatientModel()
                  };
        default:
            return state;
    }
}