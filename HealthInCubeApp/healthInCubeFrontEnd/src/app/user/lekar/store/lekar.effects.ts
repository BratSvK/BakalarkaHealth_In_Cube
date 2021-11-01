import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Router } from "@angular/router";
import { Actions, createEffect, Effect, ofType } from "@ngrx/effects";
import { Store } from "@ngrx/store";
import { ToastrService } from "ngx-toastr";
import { merge, of } from "rxjs";
import { Action } from "rxjs/internal/scheduler/Action";
import { catchError, map, switchMap, withLatestFrom } from "rxjs/operators";
import { Lekar } from "src/app/models/lekar";
import { Ziadanka } from "src/app/models/ziadanka";
import { AppState } from "src/app/_store/models/AppState";
import { environment } from "src/environments/environment";

import * as LekarActionsBundle from './lekar.actions';


const fetchUrl = environment.apiUrl; // ....../api/


@Injectable()
export class LekarEffects {


    // TO DO : dorobit craete account 

    fetchRequests = createEffect(() => 
     this.actions$.pipe(
        ofType(LekarActionsBundle.FETCH_REQUESTS),
        withLatestFrom(this.store$.select('lekar')),
        map(lekarData => {
            return +lekarData[1].practitioner.idLekar;
        }),
        switchMap(id => {
            return this.http.get<Ziadanka[]>(fetchUrl + `lekar/${id}/request/all`);
        }),
        map((ziadanky) => {
            return new LekarActionsBundle.SetRequests(ziadanky);
        })
        ));



    fetchPractitioner = createEffect(() =>
        this.actions$.pipe(
        ofType(LekarActionsBundle.FETCH_PRACTITIONER),
        withLatestFrom(this.store$.select('auth')),
        map(authData => {
            return +authData[1].user.id;
        }),
        switchMap(id => {
            return this.http.get<Lekar>(fetchUrl + `lekar/user/${id}`) 
            .pipe(
                map((pract) => {
                    // this.toastr.success("Lekar pridany");
                    return new LekarActionsBundle.SetPractitioner(pract);
                }),
                catchError((error) => {
                    console.log(error.error);
                    return of(new LekarActionsBundle.SetPractitioner(null));
            })
            );
        }),
        )
  );




    constructor(
        private actions$: Actions,
        private http: HttpClient,
        private store$: Store<AppState>,
        private router: Router,
        private toastr: ToastrService
      ) {}
}



