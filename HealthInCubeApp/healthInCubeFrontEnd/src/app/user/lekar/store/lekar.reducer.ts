import { LekarState } from "./modelStore/LekarState";
import * as LekarActionsBundle from './lekar.actions';


const initialLekarState: LekarState = {
    practitioner: null,
    ziadanky: []
}


export function lekarReducer(state: LekarState = initialLekarState, action: LekarActionsBundle.LekarActions) {
    switch (action.type) {
        case LekarActionsBundle.SET_REQUESTS:
            return {
                ...state,
                ziadanky: [...action.payload]
            };

            case LekarActionsBundle.SET_REQUESTS:
            return {
                ...state,
                lekarId: action.payload
            };

        case LekarActionsBundle.SET_PRACTITIONER:
        return {
          ...state,
          practitioner: {...action.payload},
        };
            
        default:
            return state;
    }
}
