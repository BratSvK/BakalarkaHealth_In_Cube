import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

import * as AuthActionBundle from '../auth/store/auth.actions';
import { ForgotPassword } from '../models/zabudnuteHeslo/forgotPassword';
import { ResetPassword } from '../models/zabudnuteHeslo/resetPassword';
import { CLIENT_URI_RESET_PASSWORD, UCET_API } from '../_constants/endPointsApi';
import { AppState } from '../_store/models/AppState';


// managing only expiration token for user 
@Injectable({
  providedIn: 'root',
})
export class AuthService {

  // manage user with subject 
  // on demand fetchi user data 
  // token: string = null;
  // new type of subject -> behaviourSubject(store a value inside) -> call/sub -> difference is -> get acces to the latest user without subscribe in the time 
  // user = new BehaviorSubject<User>(null);
  
  baseUrl = environment.apiUrl;
  private tokenExpirationTimer: any;

  constructor(
    private store: Store<AppState>,
    private http: HttpClient
  ) {}

  // autologin after expires one hour 
  setLogoutTimer(expirationDuration: number) {
    this.tokenExpirationTimer = setTimeout(() => {
      this.store.dispatch(new AuthActionBundle.Logout);
    }, expirationDuration );
  }


  clearLoggoutTimer() {
    if (this.tokenExpirationTimer){
      clearTimeout(this.tokenExpirationTimer);
      this.tokenExpirationTimer = null;
    }
  }

   forgotPasswordUser(forgotUserData: ForgotPassword): Observable<any> {
    const url = `${this.baseUrl}${UCET_API}/forgotPassword`;
    forgotUserData.clientURI = `${CLIENT_URI_RESET_PASSWORD}`;
    return this.http.post(url, forgotUserData);
  }

  resetPasswordUser(resetUserData: ResetPassword): Observable<any> {
    const url = `${this.baseUrl}${UCET_API}/resetPassword`;
    return this.http.post(url, resetUserData);
  }


  // OLD WAY WITHOUT REDUX PATTERN
  // signup(signUpForm: SignUp) {
  //   const signInObject = this.createModelToSend(signUpForm);

  //   return this.http
  //     .post<AuthResponseData>(
  //       'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key='+ environment.firebaseAPIkey,
  //       signInObject
  //     )
  //     .pipe(
  //       catchError(this.handleError),
  //       tap((resData) => {
  //        this.handleAuth(resData);
  //       })
  //     );
  // }

  // logiIn(signUpForm: SignUp) {
  //   const signInObject = this.createModelToSend(signUpForm);

  //   // only prepare it here
  //   return this.http
  //     .post<AuthResponseData>(
  //       'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=' + environment.firebaseAPIkey,
  //       signInObject
  //     )
  //     .pipe(
  //       catchError(this.handleError),
  //       tap((resData) => {
  //         this.handleAuth(resData);
  //       })
  //     );
  // }


  // logout() {
  //   // this.user.next(null);
    
  //   this.router.navigate(['/auth']);
  //   localStorage.removeItem('userData');
  //   // checl and clear expiration timer 
  //   if (this.tokenExpirationTimer) {
  //     clearTimeout(this.tokenExpirationTimer);
  //   }

  // }

  // // check localStorage 
  // autoLogin() {
  //   const userDataToSend: {
  //     email: string;
  //     id: string;
  //     _token: string;
  //     _tokenExpirationDate: string;
  //   } = JSON.parse(localStorage.getItem('userData'));

  //   if (!userDataToSend) {
  //     return;
  //   }

  //   const loadedUser = new User(
  //     userDataToSend.email,
  //     userDataToSend.id,
  //     userDataToSend._token,
  //     new Date(userDataToSend._tokenExpirationDate)
  //   );

  //     // using get -> validation 
  //     if (loadedUser.token) {
  //       // this.user.next(loaderUser);
  //       this.store.dispatch(new AuthActionsBundle.Loggin({email: loadedUser.email, userId: loadedUser.id, token: loadedUser.token, expirationDate: loadedUser.tokenExpi}));
  //       const expirationDuration = new Date(userDataToSend._tokenExpirationDate).getTime() - new Date().getTime();
  //       this.autoLogout(expirationDuration);
  //     }

  // } 
 

}
