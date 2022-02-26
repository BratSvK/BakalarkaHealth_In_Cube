import { Injectable } from "@angular/core";
import { createEffect, Actions, ofType } from "@ngrx/effects";
import { Store } from "@ngrx/store";
import { AppState } from "src/app/_store/models/AppState";
import { environment } from "src/environments/environment";
import { HttpClient, HttpErrorResponse, HttpParams } from "@angular/common/http";
import * as RegisterAcitonsBundle from './register.actions';

import { catchError, map, switchMap, tap } from "rxjs/operators";
import { Okres } from "src/app/models/okres";
import { Mesto } from "src/app/models/mesto";
import { Lekar } from "src/app/models/lekar/lekar";
import { of } from "rxjs";
import { RegisterPouzivatel } from "src/app/models/pouzivatelRegistracia";
import { Router } from "@angular/router";
import { ToastrService } from "ngx-toastr";
import { Mail } from "src/app/models/mail";
import { Pouzivatel } from "src/app/models/pouzivatel";
import { handleError } from "src/app/shared/auth-common";


const fetchUrl = environment.apiUrl; // ....../api/


@Injectable()
export class RegisterEffects {
  fetchOkresy = createEffect(() =>
    this.actions$.pipe(
      ofType(RegisterAcitonsBundle.FETCH_OKRESY),
      switchMap(() => {
        return this.http.get<Okres[]>(fetchUrl + 'clenenieSlovenska/okresy');
      }),
      map((okresy) => {
        return new RegisterAcitonsBundle.SetOkresy(okresy);
      })
    )
  );

  fetchMesta = createEffect(() =>
    this.actions$.pipe(
      ofType(RegisterAcitonsBundle.FETCH_MESTA),
      switchMap((action: RegisterAcitonsBundle.FetchMesta) => {
        return this.http.get<Mesto[]>(
          fetchUrl + `clenenieSlovenska/okres/${action.payload}/mesta`
        );
      }),
      map((mesta) => {
        return new RegisterAcitonsBundle.SetMesta(mesta);
      })
    )
  );

  fetchOkresyBirth = createEffect(() =>
  this.actions$.pipe(
    ofType(RegisterAcitonsBundle.FETCH_OKRESY_BIRTH),
    switchMap(() => {
      return this.http.get<Okres[]>(fetchUrl + 'clenenieSlovenska/okresy');
    }),
    map((okresy) => {
      return new RegisterAcitonsBundle.SetOkresyBBirth(okresy);
    })
  )
);

fetchMestaBirth = createEffect(() =>
  this.actions$.pipe(
    ofType(RegisterAcitonsBundle.FETCH_MESTA_BIRTH),
    switchMap((action: RegisterAcitonsBundle.FetchMestaBirth) => {
      return this.http.get<Mesto[]>(
        fetchUrl + `clenenieSlovenska/okres/${action.payload}/mesta`
      );
    }),
    map((mesta) => {
      return new RegisterAcitonsBundle.SetMestaBirth(mesta);
    })
  )
);



  fetchPractitioner = createEffect(() =>
    this.actions$.pipe(
      ofType(RegisterAcitonsBundle.FETCH_PRACTITIONERS),
      switchMap((action: RegisterAcitonsBundle.FetchPractitioners) => {
        let params = new HttpParams();

        params = params.append('idCity', action.payload.idMesto.toString());
        params = params.append('age', action.payload.vek.toString());

        return this.http.get<Lekar[]>(fetchUrl + `nemocnica/vseobecnyLekary`, {
          observe: 'response',
          params,
        }).pipe(
            map((pract) => {
                // this.toastr.success("Lekar pridany");
                return new RegisterAcitonsBundle.SetPractitioners(pract.body);
              }),
            catchError((error) => {
                console.log(error.error);
                return of(new RegisterAcitonsBundle.SetPractitioners([]));
          })
        );
      }),
    )
  );




  authSignup = createEffect(() =>
    this.actions$.pipe(
      ofType(RegisterAcitonsBundle.REGISTER_START),
      
      switchMap((authSignData: RegisterAcitonsBundle.RegisterUserStart) => {
        // const signInObject = this.createModelToSend(authSignData.payload);

        return this.http
          .post<Pouzivatel>(fetchUrl + 'ucet/register',
            authSignData.payload
          )
          .pipe(
            // return a observable automaticly
           
            map(() => {
              return new RegisterAcitonsBundle.RegisterUserSuccess();
            }),
            catchError((error) => {
              // returning non error observable
              const errorToSend = handleError(error);
              this.toastr.error(errorToSend);
              return of(new RegisterAcitonsBundle.RegisterUserFailed());
            })
          );
      })
    )
  );

  authSignupLekar = createEffect(() =>
    this.actions$.pipe(
      ofType(RegisterAcitonsBundle.REGISTER_LEKAR_START),
      
      switchMap((authSignData: RegisterAcitonsBundle.RegisterStartLekar) => {
        // const signInObject = this.createModelToSend(authSignData.payload);

        return this.http
          .post(fetchUrl + 'ucet/register/lekar',
            authSignData.payload
          )
          .pipe(
            // return a observable automaticly
           
            map(() => {
              return new RegisterAcitonsBundle.RegisterUserSuccess();
            }),
            catchError((error) => {
              // returning non error observable
              const errorToSend = handleError(error);
              this.toastr.error(errorToSend);
              return of(new RegisterAcitonsBundle.RegisterUserFailed());
            })
          );
      })
    )
  );


  authRedirect = createEffect(
    () =>
      this.actions$.pipe(
        ofType(RegisterAcitonsBundle.REGISTER_SUCCESS),
        tap(() => {
            this.toastr.success("Účet vytvorený, počkajte na prijatie príšlušným vyšším orgánom.");
            this.router.navigate(['/auth']);
        })
      ),
    { dispatch: false } // just create a effect to UI
  );

  constructor(
    private actions$: Actions,
    private http: HttpClient,
    private router: Router,
    private toastr: ToastrService
  ) {}

}






