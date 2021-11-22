import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Actions, createEffect, ofType } from "@ngrx/effects";
import { Store } from "@ngrx/store";
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { catchError, map, switchMap, take, withLatestFrom } from "rxjs/operators";
import { Mesto } from "src/app/models/mesto";
import { PouzivatelDetail } from "src/app/models/pouzivatel-detail";
import { AppState } from "src/app/_store/models/AppState";
import { environment } from "src/environments/environment";
import * as UserDetailActions from './user-detail.actions';

const fetchUrl = environment.apiUrl; // ....../api/


@Injectable()
export class UserDetailEffects {

    fetchUserDetail = createEffect(() => 
    this.actions$.pipe(
        ofType(UserDetailActions.FET_USER_DETAIL),
        switchMap(() => {
            return this.http.get<PouzivatelDetail>(fetchUrl + `pouzivatel/detail`)
        }),
        map((userDetail) => {
            return new UserDetailActions.SetUserDetail(userDetail);
        }),
        catchError((error) => {
            // returning non error observable
            this.toastr.error(error?.error);
            return of(error.error); // creating a new observable without error
          })
    ));

    fetchMesta = createEffect(() =>
    this.actions$.pipe(
      ofType(UserDetailActions.FET_USER_DETAIL),
      withLatestFrom(this.store.select('userDetail').pipe(map(userData => {
          return userData.mesta;
      }))),
      switchMap(([action, mesta]) => {
          if (!mesta.length || mesta.length === 1) {
            return this.http.get<Mesto[]>(
                fetchUrl + `clenenieSlovenska/mesta`
              ).pipe(
                map((mesta) => {
                    return new UserDetailActions.SetMestaAll(mesta);
                  })
              );
          }
          return of(new UserDetailActions.Dummy());
      }),
    )
  );
 
    updateBydlisko = createEffect(() => 
        this.actions$.pipe(
            ofType(UserDetailActions.UPDATE_BYDLISKO),
            switchMap((bydliskoData: UserDetailActions.UpdateBydlisko) => {
                const idBydlisko = bydliskoData.payload.idBydliska;
                return this.http.put(fetchUrl + `pouzivatel/address/${idBydlisko}/update`, bydliskoData.payload)
            }),
            map(() => {
                this.toastr.success("Adresa aktualizovaná");
            }),
            catchError((error) => {
                // returning non error observable
                this.toastr.error(error?.error);
                return of(error.error); // creating a new observable without error
            })

    ), {dispatch: false});



    createBydlisko = createEffect(() => 
        this.actions$.pipe(
            ofType(UserDetailActions.ADD_BYDLISKO),
            switchMap((bydliskoData: UserDetailActions.AddBydlisko) => {
                return this.http.post(fetchUrl + `pouzivatel/address/create`, bydliskoData.payload)
            }),
            map(() => {
                this.toastr.success("Adresa pridaná");
            }),
            catchError((error) => {
                // returning non error observable
                this.toastr.error("Chyba pri pridavaní adresy");
                return of(error.error); // creating a new observable without error
            })

    ), {dispatch: false});


    constructor(
        private actions$: Actions,
        private http: HttpClient,
        private toastr: ToastrService,
        private store: Store<AppState>
      ) {}

}