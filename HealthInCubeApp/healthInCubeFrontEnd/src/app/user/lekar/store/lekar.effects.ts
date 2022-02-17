import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Actions, createEffect, ofType } from "@ngrx/effects";
import { Store } from "@ngrx/store";
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { catchError, map, switchMap, withLatestFrom } from "rxjs/operators";
import { Lekar } from "src/app/models/lekar/lekar";
import { ZiadankaPacient } from "src/app/models/ziadanka/ziadankaPacient";
import { LekarIdService } from "src/app/_service/lekar-id.service";
import { AppState } from "src/app/_store/models/AppState";
import { environment } from "src/environments/environment";

import * as LekarActionsBundle from './lekar.actions';

const fetchUrl = environment.apiUrl; // ....../api/

@Injectable()
export class LekarEffects {

    fetchRequests = createEffect(() => 
     this.actions$.pipe(
        ofType(LekarActionsBundle.FETCH_REQUESTS),
        withLatestFrom(this.store$.select('lekar')),
        map(lekarData => {
            return +lekarData[1].practitioner.idLekar;
        }),
        switchMap(id => {
            return this.http.get<ZiadankaPacient[]>(fetchUrl + `lekar/${id}/request/all`);
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
                    this.lekarIdService.setId(pract.idLekar);
                    return new LekarActionsBundle.SetPractitioner(pract);
                }),
                catchError((error) => {
                    console.log(error.error);
                    return of(new LekarActionsBundle.SetPractitioner(null));
            })
            );
        }),
        ));

        acceptRequestAndCreatePatient = createEffect(() => 
        this.actions$.pipe(
            ofType(LekarActionsBundle.ACCEPT_REQUEST),
            switchMap((action: LekarActionsBundle.AcceptRequest) => {
                return this.http.post<ZiadankaPacient>(fetchUrl + `lekar/createPatientAccount`, action.payload).pipe(
                    map((ziadanka) => {
                        this.toastr.success("Pacient vytvorený");
                        return new LekarActionsBundle.DeleteRequest(ziadanka);
                    }),
                    catchError((error) => {
                        this.toastr.error("Nastala chyba" + error?.error);
                        return of(error?.error);
                })
                );
            })
        ));
  

    constructor(
        private actions$: Actions,
        private http: HttpClient,
        private store$: Store<AppState>,
        private toastr: ToastrService,
        private lekarIdService: LekarIdService
      ) {}
}



