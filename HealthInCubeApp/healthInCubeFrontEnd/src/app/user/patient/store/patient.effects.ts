import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Actions, createEffect, ofType } from "@ngrx/effects";
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { catchError, map, switchMap } from "rxjs/operators";
import { environment } from "src/environments/environment";
import * as PatientActionsBundle from './patient.actions';

const fetchUrl = environment.apiUrl; // ....../api/


@Injectable()
export class PatientEffects {

    isActivated = createEffect(() => 
    this.actions$.pipe(
        ofType(PatientActionsBundle.GET_IS_ACTIVATED),
        switchMap((userId: PatientActionsBundle.IsActivated) => {
            return this.http.get<boolean>(fetchUrl + `pacient/${userId.payload}/activated`)
        }),
        map((isAcitvated) => {
            return new PatientActionsBundle.SetIstActivated(isAcitvated);
        }),
        catchError((error) => {
            // returning non error observable
            this.toastr.error(error?.error);
            return of(); // creating a new observable without error
          })
    ), {dispatch: false}
    )


    constructor(
        private actions$: Actions,
        private http: HttpClient,
        private toastr: ToastrService
      ) {}

}