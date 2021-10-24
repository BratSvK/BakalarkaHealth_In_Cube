import { HttpClient, HttpErrorResponse } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { DomSanitizer } from "@angular/platform-browser";
import { Router } from "@angular/router";
import { Actions, createEffect, Effect, ofType } from "@ngrx/effects";
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { catchError, map, switchMap, tap } from "rxjs/operators";
import { Pouzivatel } from "src/app/models/pouzivatel";
import { PrihlaseniePouzivatel } from "src/app/models/prihlaseniePouzivatel";
import { UserToLogin } from "src/app/models/userToLogin";
import { extractFotoFromApi } from "src/app/shared/foto-extract";
import { AuthService } from "src/app/_service/auth.service";
import { environment } from "src/environments/environment";
import * as AuthActionsBundle from './auth.actions';


const fetchUrl = environment.apiUrl; // ....../api/



// we are injetinc actions and http client 
@Injectable()
export class AuthEffects {
  // actions -> one big observable with all dispatch actions and work with them(No change state)
  // stram of dispatch actions

 
  // register first effect handler
  // this effects automaticly dispatch a new action
  authLogin = createEffect(() =>
    this.actions$.pipe(
      // it must never die it's stream in global
      ofType(AuthActionsBundle.LOGIN_START), // define a filter of which type of effects we wanna handle
      switchMap((authData: AuthActionsBundle.LoginStart) => {
        // allows us to create a new obervable to taking a anther obervables data

        const signInObject = this.createModelToSend(authData.payload);
        return this.http
          .post<UserToLogin>(fetchUrl + 'ucet/login',
            signInObject
          )
          .pipe(
            // return a observable automaticly
            map((resData) => {
              return this.handleAuthentification(resData);
            }),
            catchError((error) => {
              // returning non error observable
              const errorToSend = this.handleError(error);
              this.toastr.error(errorToSend);
              return of(new AuthActionsBundle.LoginFail(errorToSend)); // creating a new observable without error
            })
          );
      })
    )
  );

  // not yield dispatchable action

  authRedirect = createEffect(
    () =>
      this.actions$.pipe(
        ofType(AuthActionsBundle.LOGIN),
        tap(() => {
            this.toastr.success("Succesfully logged");
            this.router.navigate(['/user']);
        })
      ),
    { dispatch: false } // just create a effect to UI
  );

  authLogout = createEffect(
    () =>
      this.actions$.pipe(
        ofType(AuthActionsBundle.LOGOUT),
        tap(() => {
          this.authService.clearLoggoutTimer();
          localStorage.removeItem('userData');
          this.router.navigate(['/auth']);
        })
      ),
    { dispatch: false }
  );

  autoLogin = createEffect(() =>
    this.actions$.pipe(
      ofType(AuthActionsBundle.AUTO_LOGIN),
      map(() => {
        const userDataToSend: Pouzivatel = JSON.parse(localStorage.getItem('userData'));

        if (!userDataToSend) {
          return {type: '[Auth] No User'};
        }

        const loadedUser = new Pouzivatel(
          userDataToSend.email,
          userDataToSend.userId,
          userDataToSend.fullName,
          userDataToSend.fotka,
          userDataToSend.token,
          new Date(userDataToSend.tokenExpi),
          userDataToSend.roleStoreBase
        );


        // using get -> validation
        if (loadedUser.token) {
           const expirationDuration = new Date(loadedUser.tokenExpi).getTime() - new Date().getTime();
           this.authService.setLogoutTimer(expirationDuration);


           let image: any;
           if (loadedUser.fotka) {
             image = extractFotoFromApi(loadedUser.fotka, this.sanitizer);
           } else {
             image = loadedUser.fotka
           }

          return new AuthActionsBundle.AuthentificateSuccess({
            email: loadedUser.email,
            userId: loadedUser.userId,
            token: loadedUser.token,
            expirationDateToken: loadedUser.tokenExpi,
            fotka: image,
            roleStoreBase: loadedUser.roleStoreBase,
            fullName: loadedUser.fullName
          });
         
        }

        return {type: '[Auth] TokenExpires'};
      })
    )
  );





  constructor(
    private actions$: Actions,
    private http: HttpClient,
    private router: Router,
    private authService: AuthService,
    private toastr: ToastrService,
    private sanitizer: DomSanitizer
  ) {}

  private handleError(errorRes: HttpErrorResponse) {
    let errorMessage = 'An uknown error occured!';
    if (!errorRes.error) {
      return errorMessage;
    }

    switch (errorRes.error) {
      case 'EMAIL_NOT_FOUND':
        errorMessage = 'This account not exists!';
        break;

      case 'INVALID_CREDENTIALS':
        errorMessage = 'This credentials are not right!';
        break;

      default:
        break;
    }
    return errorMessage;
  }

  private handleAuthentification(resData: UserToLogin) {
    resData.roleStoreBase = [];

    const expirationDate = new Date(
      resData.expirationDateToken
    ); // current timestamp in milliconds
    
    // check roles for user to save 
    const roles = this.getDecodedToken(resData.token).role;
    Array.isArray(roles) ? resData.roleStoreBase = roles : resData.roleStoreBase.push(roles);
    const user = new Pouzivatel(
        resData.email,
        resData.userId,
        resData.fullName,
        resData.fotka,
        resData.token,
        expirationDate,
        resData.roleStoreBase
    );

    const today = new Date();
    const endDateTokenMiliseconds = expirationDate.getTime() - today.getTime(); 


  // set timer here or in pipeline of obervable
    this.authService.setLogoutTimer(endDateTokenMiliseconds);


    localStorage.setItem('userData', JSON.stringify(user));

    let image: any;
    if (resData.fotka) {
      image = extractFotoFromApi(resData.fotka, this.sanitizer);
    } else {
      image = resData.fotka
    }



    return new AuthActionsBundle.AuthentificateSuccess({
      email: resData.email,
      userId: resData.userId,
      token: resData.token,
      expirationDateToken: expirationDate,
      fotka: image,
      fullName: resData.fullName,
      roleStoreBase: resData.roleStoreBase,
    });
  }



  private getDecodedToken(token: string) {
   // token -> header , payload, signature 
    // acces to payload
    return JSON.parse(atob(token.split('.')[1]));
  }

  private createModelToSend(signUpForm: PrihlaseniePouzivatel) {
    return {
      email: signUpForm.email,
      password: signUpForm.password,
      returnSecureToken: true,
    };
  }
}