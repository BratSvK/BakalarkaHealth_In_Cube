import { nullSafeIsEquivalent } from '@angular/compiler/src/output/output_ast';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { UserToLogin } from 'src/app/models/userToLogin';
import { AuthRoutingModule } from '../auth-routing.module';
import * as AuthActionsBundle from '../store/auth.actions';
import { AuthState } from './modelStore/AuthState';

// only state is a user 
const initialState: AuthState = {
    user: null,
    authError: null,
    isLoading: false
};

export function authReducer(state: AuthState = initialState, action: AuthActionsBundle.AuthActions) {
    
    switch (action.type) {
      case AuthActionsBundle.LOGIN:
          const userToSend = new Pouzivatel(
            action.payload.email,
            action.payload.userId,
             action.payload.fullName,
             action.payload.fotka,
             action.payload.token,
             action.payload.expirationDateToken,
             action.payload.roleStoreBase
          );
        return {
            ...state,
            authError: null,
            user: userToSend,
            isLoading: false
        };

      case AuthActionsBundle.LOGOUT:
        return {
            ...state,
            user: null
        };

      case AuthActionsBundle.LOGIN_START:
        return {
          ...state,
          authError: null,
          isLoading: true
        };

      case AuthActionsBundle.LOGIN_FAIL: 
        return {
          ...state,
          user: null,
          isLoading: false,
          authError: action.payload, // there is a message we wanna to use
        };
      case AuthActionsBundle.CLEAR_ERROR:
        return {
          ...state,
          authEror: null
        };

      default:
        return state;           // send one initial action so at first go to default case and we take initailState 
    }
   
}