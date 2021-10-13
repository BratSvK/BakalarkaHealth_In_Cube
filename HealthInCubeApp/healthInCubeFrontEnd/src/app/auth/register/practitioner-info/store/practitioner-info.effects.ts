import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Actions, createEffect, ofType } from "@ngrx/effects";
import { Store } from "@ngrx/store";
import { map, switchMap } from "rxjs/operators";
import { Lekar } from "src/app/models/lekar";
import { AppState } from "src/app/_store/models/AppState";
import { environment } from "src/environments/environment";

import * as PractitionerBundleActions from './practitioner-info.actions';


const fetchUrl = environment.apiUrl;            // ....../api/


@Injectable() 
export class PractitionerInfoEffects 
{

    fetchPractitioner = createEffect(() => 
        this.actions$.pipe(
            ofType(PractitionerBundleActions.FETCH_PRACTITIONER),
            switchMap((action: PractitionerBundleActions.FetchPractitioner) => {
               return this.http.get<Lekar>(`${fetchUrl}/lekar/${action.payload}`);
            }),
            map((practitioner) => {
                return new PractitionerBundleActions.SetPractitioner(practitioner);
            })
        )
    )



    constructor(private actions$: Actions, private http: HttpClient, private store: Store<AppState>) {}
    
}