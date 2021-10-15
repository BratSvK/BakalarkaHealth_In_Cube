import { Injectable } from "@angular/core";
import { createEffect, Actions, ofType } from "@ngrx/effects";
import { Store } from "@ngrx/store";
import { AppState } from "src/app/_store/models/AppState";
import { environment } from "src/environments/environment";
import { HttpClient, HttpParams } from "@angular/common/http";
import * as RegisterAcitonsBundle from './register.actions';

import { catchError, map, switchMap } from "rxjs/operators";
import { Okres } from "src/app/models/okres";
import { Mesto } from "src/app/models/mesto";
import { Lekar } from "src/app/models/lekar";
import { Observable, of } from "rxjs";







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

  constructor(
    private actions$: Actions,
    private http: HttpClient,
    private store: Store<AppState>
  ) {}
}




