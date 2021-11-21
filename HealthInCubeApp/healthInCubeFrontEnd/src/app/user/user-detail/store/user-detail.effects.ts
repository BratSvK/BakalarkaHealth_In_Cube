import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { faThList } from "@fortawesome/free-solid-svg-icons";
import { Actions, createEffect, ofType } from "@ngrx/effects";
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { catchError, map, switchMap } from "rxjs/operators";
import { Bydlisko } from "src/app/models/bydlisko";
import { PouzivatelDetail } from "src/app/models/pouzivatel-detail";
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
                this.toastr.error(error?.error);
                return of(error.error); // creating a new observable without error
            })

    ), {dispatch: false});


    constructor(
        private actions$: Actions,
        private http: HttpClient,
        private toastr: ToastrService
      ) {}

}