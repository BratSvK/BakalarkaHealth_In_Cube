import { Bydlisko } from 'src/app/models/bydlisko';
import { PouzivatelDetail } from 'src/app/models/pouzivatel-detail';
import { UserDetailState } from './modelStore/UserDetailState';
import * as UserDetailActions from './user-detail.actions';

import { cloneDeep } from 'lodash';

// only state is a user
const initialState: UserDetailState = {
  userDetail: null as PouzivatelDetail,
  bydliska: [],
  editedBydlisko: null as Bydlisko,
  editedBydliskoIndex: -1,
  mesta: []
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
        bydliska: action.payload.bydliskos,
      };
    case UserDetailActions.RESET_USER_DETAIL:
      return (state = { ...initialState });
    case UserDetailActions.ADD_BYDLISKO:
      // return a new objects with old state add to new object -> copy of old state
      const oldArrayOfBydlisko = [...state.bydliska];
      let changeTrvalaInBydliska: Bydlisko[] = cloneDeep(oldArrayOfBydlisko)

      if (action.payload.trvale)
      changeTrvalaInBydliska.forEach(b => b.trvale = false);

      return {
        ...state, // copy old state ! always
        bydliska: [...changeTrvalaInBydliska, action.payload],
      };
      case UserDetailActions.SET_ID_BYDLISKO:
        const oldArrayOfBydliska = [...state.bydliska];
        let oldBydlisko = oldArrayOfBydliska.filter(b => b.ulica === action.payload.ulica)[0];

        const updatedBydliskoId = {
          ...oldBydlisko, // copy old properties and
          ...action.payload, // override the old properties
        };
      
      const newArrayBydliska = [...oldArrayOfBydliska];
      const indexInArrayList = newArrayBydliska.findIndex(b => b.ulica === action.payload.ulica);

      newArrayBydliska[indexInArrayList] = updatedBydliskoId;

      return {
        ...state,
        bydliska: newArrayBydliska
      };
    case UserDetailActions.UPDATE_BYDLISKO:
      // IMUTABLE - logic
      const bydliskaListToEDit = [...state.bydliska]; // it's a new array
      const bydlisko = bydliskaListToEDit.filter(b => b.idBydliska === action.payload.idBydliska)[0]
      const updatedBydlisko = {
        ...bydlisko, // copy old properties and
        ...action.payload, // override the old properties
      };

      const updatedBydliska = [...state.bydliska]; // it's a new array
      const indexInArray = updatedBydliska.findIndex(b => b.idBydliska === updatedBydlisko.idBydliska);
      updatedBydliska[indexInArray] = updatedBydlisko;

      let changeTrvalaInBydliskaNew: Bydlisko[] = cloneDeep(updatedBydliska)

      if (action.payload.trvale)
      changeTrvalaInBydliskaNew.filter(b => b.idBydliska !== updatedBydlisko.idBydliska).forEach(b => b.trvale = false);


      return {
        ...state,
        bydliska: changeTrvalaInBydliskaNew,
        editedBydlisko: null,
        editedBydliskoIndex: -1,
      };
    case UserDetailActions.START_EDIT:
      const bydliskaList = [...state.bydliska]; // it's a new array

      const bydliskoToEdit = bydliskaList.filter(b => b.idBydliska === action.payload)[0];

      return {
        ...state,
        editedBydliskoIndex: action.payload,
        editedBydlisko: { ...bydliskoToEdit}, // IMUTABLE WAY
      };
    case UserDetailActions.STOP_EDIT:
      return {
        ...state,
        editedBydliskoIndex: -1,
        editedBydlisko: null,
      };
    case UserDetailActions.SET_ALL_MESTA:
      return {
        ...state,
        mesta: [...action.payload],
      };
    default:
      return state;
  }
}
