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

        case LekarActionsBundle.DELETE_REQUEST:
            return {
                ...state,
                ziadanky: state.ziadanky.filter((ziadanka, index) => {
                    return ziadanka.idUser !== action.payload.idUser;
                })
            }

        case LekarActionsBundle.RESET_PRACTITIONER:
                return {
                  ...state,
                  practitioner: null,
                  ziadanky: []
                };
            
        default:
            return state;
    }
}
