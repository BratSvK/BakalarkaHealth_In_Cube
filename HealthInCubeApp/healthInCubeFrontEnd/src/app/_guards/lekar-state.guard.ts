import { Injectable } from "@angular/core";
import { CanActivate } from "@angular/router";
import { Store } from "@ngrx/store";
import { Observable, of } from "rxjs";
import { catchError, filter, switchMap, take, tap } from "rxjs/operators";
import { Lekar } from "../models/lekar/lekar";
import { getPractitionerState } from "../user/lekar/store/modelStore/LekarState";
import { AppState } from "../_store/models/AppState";

import * as LekarActionsBundle from '../user/lekar/store/lekar.actions';
import { notNull } from "../shared/common";

@Injectable({
  providedIn: 'root'
})
export class LekarStateGuard implements CanActivate {

    constructor(private store: Store<AppState>) {}

    canActivate():  Observable<boolean> {
        // tu budeme kontrolovat ci sme prihlaseny alebo nie 
      return this.getLekarStateFromStoreOrAPI()
      .pipe(
        switchMap(() => of(true)),
        catchError(() => of(false))
      )
    }

    getLekarStateFromStoreOrAPI(): Observable<any> {
        return this.store.select(getPractitionerState)
        .pipe(
          tap((data: Lekar) => {
            if (!!data) {
              this.store.dispatch(new LekarActionsBundle.FetchPractitioner());
            }
          }),
          filter(notNull),
          take(1)
        );
    }
}