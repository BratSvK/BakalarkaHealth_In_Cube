import { Lekar } from "src/app/models/lekar";
import { PractitionerInfoState } from "./modelStore/PractiotionerInfoState";

import * as PractitionerBundleActions from './practitioner-info.actions';

const initialPractitionerInfoState: PractitionerInfoState = {
    registerLekar: null as Lekar
};



export function practitionerInfoReducer(state: PractitionerInfoState = initialPractitionerInfoState,
    action: PractitionerBundleActions.RegisterActions )
    {
        switch (action.type) {
            case PractitionerBundleActions.SET_PRACTITIONER:
                return {
                    ...state,
                    registerLekar: {...action.payload}
                }
                
            default:
                return state;
        }
    }