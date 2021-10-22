import { PatientState } from "./modelStore/PatientState";
import * as PatientActionsBundle from './patient.actions';


// only state is a user 
const initialState: PatientState = {
    isActivated: false
};



export function patientReducer(state: PatientState = initialState, action: PatientActionsBundle.PatientActions) {
    switch (action.type) {
        case PatientActionsBundle.IS_ACTIVATED:
            return {
                ...state,
                isActivated: true
            }
        default:
            return state;
    }
}