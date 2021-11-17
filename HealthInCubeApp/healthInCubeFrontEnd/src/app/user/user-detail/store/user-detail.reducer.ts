import { UserDetailState } from './modelStore/UserDetailState';
import * as UserDetailActions from './user-detail.actions';

// only state is a user
const initialState: UserDetailState = {
  userDetail: null,
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
      };
    case UserDetailActions.RESET_USER_DETAIL:
      return (state = { ...initialState });
    default:
      return state;
  }
}
