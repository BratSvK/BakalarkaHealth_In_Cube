import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { Store } from '@ngrx/store';
import { AppState } from 'src/app/_store/models/AppState';
import { Actions, ofType} from '@ngrx/effects';
import { map, switchMap, take } from 'rxjs/operators';
import { of } from 'rxjs';
import { PouzivatelDetail } from 'src/app/models/pouzivatel-detail';

import * as UserDetailActions from './store/user-detail.actions';

@Injectable({
  providedIn: 'root'
})
export class UserDetailResolver implements Resolve<PouzivatelDetail> {

  constructor(private store: Store<AppState>, private actions$: Actions) { }

  // dopt send request if we already have request loaded 
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    // wait to complete 
    return this.store.select('userDetail').pipe(
      take(1),
      map(userDetailState => {
        // empty or fill array
        return userDetailState.userDetail;               
      }),
      switchMap(userDetail => {
        if (userDetail == null) {
          this.store.dispatch(new UserDetailActions.FetchUserDetail());

          return this.actions$.pipe(
            ofType(UserDetailActions.SET_USER_DETAIL), 
            take(1)
            );
        } else {
          return of(userDetail);
        }
      })
      );
  }
  
}
