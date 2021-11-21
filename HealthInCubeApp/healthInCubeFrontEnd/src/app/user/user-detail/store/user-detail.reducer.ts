import { Bydlisko } from 'src/app/models/bydlisko';
import { PouzivatelDetail } from 'src/app/models/pouzivatel-detail';
import { UserDetailState } from './modelStore/UserDetailState';
import * as UserDetailActions from './user-detail.actions';

// only state is a user
const initialState: UserDetailState = {
  userDetail: null as PouzivatelDetail,
  bydliska: [],
  editedBydlisko: null as Bydlisko,
  editedBydliskoIndex: -1
};

export function userDetailReducer(
  state: UserDetailState = initialState,
  action: UserDetailActions.UserDetailActions
) {
  switch (action.type) {
    case UserDetailActions.SET_USER_DETAIL:
      return {
        ...state,
        userDetail: action.payload,
        bydliska: action.payload.bydliskos
      };
    case UserDetailActions.RESET_USER_DETAIL:
      return (state = { ...initialState });

      case UserDetailActions.ADD_BYDLISKO:
      // return a new objects with old state add to new object -> copy of old state
      return {
        ...state, // copy old state ! always
        bydliska: [...state.bydliska, action.payload],
      };

      case UserDetailActions.UPDATE_BYDLISKO:
      // IMUTABLE - logic
      const bydlisko = state.bydliska[state.editedBydliskoIndex];

      // ingredient.amount =  !! incorect data store in old object
      const updatedBydlisko = {
        ...bydlisko, // copy old properties and
        ...action.payload, // override the old properties
      };

      const updatedBydliska = [...state.bydliska]; // it's a new array

      updatedBydliska[state.editedBydliskoIndex] = updatedBydlisko;

      return {
        ...state,
        bydliska: updatedBydliska,
        editedBydlisko: null,
        editedBydliskoIndex: -1,
      };

      case UserDetailActions.START_EDIT:
      return {
        ...state,
        editedBydliskoIndex: action.payload - 1,
        editedBydlisko: { ...state.bydliska[action.payload - 1] }, // IMUTABLE WAY
      };
    case UserDetailActions.STOP_EDIT:
      return {
        ...state,
        editedBydliskoIndex: -1,
        editedBydlisko: null,
      };
    default:
      return state;
  }
}
