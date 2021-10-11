import { Injectable } from "@angular/core";
import { createEffect, Actions, ofType } from "@ngrx/effects";
import { Store } from "@ngrx/store";
import { AppState } from "src/app/_store/models/AppState";
import { environment } from "src/environments/environment";
import { HttpClient } from "@angular/common/http";
import * as RegisterAcitonsBundle from './register.actions';

import { map, switchMap, withLatestFrom } from "rxjs/operators";
import { Okres } from "src/app/models/okres";
import { Mesto } from "src/app/models/mesto";







const fetchUrl = environment.apiUrl; // ....../api/


@Injectable() 
export class RegisterEffects {


    fetchOkresy = createEffect(() => 
        this.actions$.pipe(
            ofType(RegisterAcitonsBundle.FETCH_OKRESY),
            switchMap(() => {
                return this.http.get<Okres[]>(fetchUrl + 'clenenieSlovenska/okresy');
            }),
            map(okresy => {
                return new RegisterAcitonsBundle.SetOkresy(okresy);
            })
        )
    );



    fetchMesta = createEffect(() => 
    this.actions$.pipe(
        ofType(RegisterAcitonsBundle.FETCH_MESTA),
        switchMap((action: RegisterAcitonsBundle.FetchMesta) => {
            return this.http.get<Mesto[]>(fetchUrl + `clenenieSlovenska/okres/${action.payload}/mesta`);
        }),
        map(mesta => {
            return new RegisterAcitonsBundle.SetMesta(mesta);
        })
    )
);



    constructor(private actions$: Actions, private http: HttpClient, private store: Store<AppState> ) {}


}




