import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { Store } from '@ngrx/store';
import { AppState } from 'src/app/_store/models/AppState';
import { Actions, ofType} from '@ngrx/effects';

import * as LekarActionsBundle from '../store/lekar.actions';
import { map, switchMap, take } from 'rxjs/operators';
import { of } from 'rxjs';
import { ZiadankaPacient } from 'src/app/models/ziadanka/ziadankaPacient';

@Injectable({
  providedIn: 'root'
})
export class ZiadankyResolverService implements Resolve<ZiadankaPacient[]> {

  constructor(private store: Store<AppState>, private actions$: Actions) { }

  // dopt send request if we already have request loaded 
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    // wait to complete 
    return this.store.select('lekar').pipe(
      take(1),
      map(lekarState => {
        // empty or fill array
        return lekarState.ziadanky;               
      }),
      switchMap(ziadanky => {
        if (ziadanky.length === 0) {
          this.store.dispatch(new LekarActionsBundle.FetchRequests());

          return this.actions$.pipe(
            ofType(LekarActionsBundle.SET_REQUESTS), 
            take(1)
            );
        } else {
          return of(ziadanky);
        }
      })
      );
  }
  
}
