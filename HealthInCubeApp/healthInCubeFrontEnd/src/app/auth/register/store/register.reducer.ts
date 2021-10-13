import { RegisterState } from './modelStore/RegisterState';
import * as RegisterAcitonsBundle from './register.actions';

const initialRegisterState: RegisterState = {
  okresy: [],
  role: [],
  mesta: [],
  practitioners: []
  
};

export function registerReducer(
  state: RegisterState = initialRegisterState,
  action: RegisterAcitonsBundle.RegisterActions
) {
  // only synchronous code

  switch (action.type) {
    case RegisterAcitonsBundle.SET_OKRESY:
      return {
        ...state,
        okresy: [...action.payload],
      };

    case RegisterAcitonsBundle.SET_MESTA:
      return {
        ...state,
        mesta: [...action.payload],
      };

      case RegisterAcitonsBundle.SET_PRACTITIONER:
        return {
          ...state,
          practitioners: [...action.payload],
        };

    default:
      return state;
  }
}
