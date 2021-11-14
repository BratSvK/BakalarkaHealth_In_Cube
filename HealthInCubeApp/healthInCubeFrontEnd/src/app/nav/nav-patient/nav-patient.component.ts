import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { map, take } from 'rxjs/operators';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { AppState } from 'src/app/_store/models/AppState';

import * as AuthActionsBundle from '../../auth/store/auth.actions';


@Component({
  selector: 'app-nav-patient',
  templateUrl: './nav-patient.component.html',
  styleUrls: ['./nav-patient.component.css']
})
export class NavPatientComponent implements OnInit {

  
  isCollapsed = false;
  user: Pouzivatel;
  isActivatedPatientFlag: boolean;
  image: any;

  constructor(private store: Store<AppState>) {
   this.store.select('patient').pipe(take(1),
    map(patientData => {
      return patientData.isActivated;
    })).subscribe(isActivated => {
      this.isActivatedPatientFlag = isActivated;
    });

   }

  ngOnInit(): void {
    this.store.select('auth').pipe(take(1),map(resData => {
            return resData.user;
          })).subscribe(user => {
            this.user = user;
          });
  }

  logout() {
    this.store.dispatch(new AuthActionsBundle.Logout());
  }

}
