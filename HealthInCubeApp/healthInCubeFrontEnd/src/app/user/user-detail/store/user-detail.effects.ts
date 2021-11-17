import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Actions, createEffect, ofType } from "@ngrx/effects";
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { catchError, map, switchMap } from "rxjs/operators";
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


    constructor(
        private actions$: Actions,
        private http: HttpClient,
        private toastr: ToastrService
      ) {}

}