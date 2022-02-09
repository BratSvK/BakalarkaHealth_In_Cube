import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Actions, createEffect, ofType } from "@ngrx/effects";
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { catchError, map, switchMap } from "rxjs/operators";
import { ActivatedPatient } from "src/app/models/pacient/activatedPatient";
import { environment } from "src/environments/environment";
import * as PatientActionsBundle from './patient.actions';

const fetchUrl = environment.apiUrl; // ....../api/


@Injectable()
export class PatientEffects {

    isActivated = createEffect(() => 
    this.actions$.pipe(
        ofType(PatientActionsBundle.GET_IS_ACTIVATED),
        switchMap((userId: PatientActionsBundle.IsActivated) => {
            return this.http.get<ActivatedPatient>(fetchUrl + `pacient/${userId.payload}/activated`)
        }),
        map((isAcitvated) => {
            return new PatientActionsBundle.SetIstActivated(isAcitvated);
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