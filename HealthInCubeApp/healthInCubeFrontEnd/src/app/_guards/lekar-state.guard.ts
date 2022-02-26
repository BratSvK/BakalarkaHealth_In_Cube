import { Injectable } from "@angular/core";
import { CanActivate, Router, UrlTree } from "@angular/router";
import { Store } from "@ngrx/store";
import { Observable, of } from "rxjs";
import { catchError, filter, map, switchMap, take, tap } from "rxjs/operators";
import { Lekar } from "../models/lekar/lekar";
import { getPractitionerState, LekarState } from "../user/lekar/store/modelStore/LekarState";
import { AppState } from "../_store/models/AppState";

import * as LekarActionsBundle from '../user/lekar/store/lekar.actions';
import { notNull } from "../shared/common";
import { ToastrService } from "ngx-toastr";
import { LekarService } from "../_service/lekar.service";

@Injectable({
  providedIn: 'root'
})
export class LekarStateGuard implements CanActivate {

    constructor(
      private store: Store<AppState>,
      private toastr: ToastrService,
      private router: Router,
      private lekarService: LekarService
      ) {}

    canActivate():  Observable<boolean | UrlTree> {
        // tu budeme kontrolovat ci sme prihlaseny alebo nie 
      return this.getLekarStateFromStoreOrAPI()
      .pipe(
        switchMap((result) => {
           if (!!result) {
            return this.lekarService.checkIsActivetedDoctorAccountApi$();
           }else {
            return this.lekarService.checkIsActivetedDoctorAccount$();
           }
        }),
        map(isActivated => {
          if (isActivated) {
            return true;
          }else {
            this.toastr.error('Účet ešte nieje aktivaný správcom nemocnice');
            return this.router.parseUrl('/auth');
          }
        }),
        catchError((error) => {
          console.log(error);
          return of(false);
        })
      )
    }

    getLekarStateFromStoreOrAPI(): Observable<LekarState> {
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