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
import { Role } from "src/app/models/user";
import { extractFotoFromApi } from "src/app/shared/foto-extract";
import { AuthService } from "src/app/_service/auth.service";
import { environment } from "src/environments/environment";
import * as AuthActionsBundle from './auth.actions';

const fetchUrl = environment.apiUrl; // ....../api/

// we are injetinc actions and http client 
@Injectable()
export class AuthEffects {
  // actions -> one big observable with all dispatch actions and work with them(No change state)
  // stream of dispatch actions
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
          .post<Pouzivatel>(fetchUrl + 'ucet/login',
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
        tap((action: AuthActionsBundle.AuthentificateSuccess) => {
            this.toastr.success("Succesfully logged");
            this.handleRedirectUser(action.payload.roleStoreBase, +action.payload.id);
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

        const loadedUser = createUser(userDataToSend);
          
        // using get -> validation
        if (loadedUser.token) {
           const expirationDuration = new Date(loadedUser.expirationDateToken).getTime() - new Date().getTime();
           this.authService.setLogoutTimer(expirationDuration);


           let image: any;
           if (loadedUser.fotka) {
             image = extractFotoFromApi(loadedUser.fotka, this.sanitizer);
           } else {
             image = loadedUser.fotka
           }

           loadedUser.fotka = image;

          return new AuthActionsBundle.AuthentificateSuccess(loadedUser);
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


  private handleRedirectUser(userRoles: string[], id: number) {

    if (userRoles.some(r => r === Role.Patient) ) {
      this.router.navigate(['/patient', id]);
    } else if (userRoles.some(r => r === Role.Practitioner)) {
      this.router.navigate(['/practitioner', id]);
    } else {
      this.router.navigate(['/admin' , id])
    }
  }

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

  private handleAuthentification(resData: Pouzivatel) {
    resData.roleStoreBase = [];

    const expirationDate = new Date(
      resData.expirationDateToken
    ); // current timestamp in milliconds
    
    // check roles for user to save 
    const roles = this.getDecodedToken(resData.token).role;
    Array.isArray(roles) ? resData.roleStoreBase = roles : resData.roleStoreBase.push(roles);
    const user = createUser(resData);
    
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

    user.fotka = image;

    return new AuthActionsBundle.AuthentificateSuccess(user);
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


export function createUser(userDataToSend: Pouzivatel): Pouzivatel {
  return {
    id: userDataToSend.id,
    email: userDataToSend.email,
    fotka: userDataToSend.fotka,
    fullName: userDataToSend.fullName,
    token: userDataToSend.token,
    expirationDateToken: new Date(userDataToSend.expirationDateToken),
    bydliskos:userDataToSend.bydliskos,
    poslednePrihlasenie:  new Date(userDataToSend.poslednePrihlasenie),
    roleStoreBase: userDataToSend.roleStoreBase,
    datNarodenia: new Date(userDataToSend.datNarodenia),
    registrovany: new Date(userDataToSend.registrovany),
  };
}
