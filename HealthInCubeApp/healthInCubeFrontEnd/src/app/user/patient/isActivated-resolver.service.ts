import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { Store } from '@ngrx/store';
import { AppState } from 'src/app/_store/models/AppState';
import { Actions, ofType} from '@ngrx/effects';

import * as PatientActionsBundle from './store/patient.actions';
import { map, switchMap, take } from 'rxjs/operators';
import { of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class IsActivatedResolver implements Resolve<boolean> {

  constructor(private store: Store<AppState>, private actions$: Actions) { }

  // dopt send request if we already have request loaded 
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    // wait to complete 
    return this.store.select('patient').pipe(
      take(1),
      map(patientState => {
        // empty or fill array
        return patientState.activatedPatient.isActivated;               
      }),
      switchMap(isActivated => {
        if (!isActivated) {
          this.store.dispatch(new PatientActionsBundle.IsActivated(+route.paramMap.get('id')));

          return this.actions$.pipe(
            ofType(PatientActionsBundle.SET_IS_ACTIVATED), 
            take(1)
            );
        } else {
          return of(isActivated);
        }
      })
      );
  }  
}
