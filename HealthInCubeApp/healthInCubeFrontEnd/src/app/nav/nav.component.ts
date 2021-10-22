import { Component, OnDestroy, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { map, take } from 'rxjs/operators';
import { Pouzivatel } from '../models/pouzivatel';
import { AppState } from '../_store/models/AppState';
import * as AuthActionsBundle from '../auth/store/auth.actions';
import { Subscription } from 'rxjs';


@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.css']
})
export class NavComponent implements OnInit, OnDestroy {

  user: Pouzivatel;
  isActivatedPatientFlag: boolean;

  sub: Subscription;

  constructor(private store: Store<AppState>) { }
 

  ngOnInit(): void {
    
    this.store.select('auth').pipe(take(1),map(resData => {
      return resData.user;
    })).subscribe(user => {
      this.user = user;
    });

    this.sub = this.store.select('patient').pipe(map(patientData => {
      return patientData.isActivated;
    })).subscribe(isActivated => {
      this.isActivatedPatientFlag = isActivated;
    })


  }


  logout() {
    this.store.dispatch(new AuthActionsBundle.Logout());
  }


  isPatient() {
   return this.user.roleStoreBase[0].trim().toLowerCase() === 'pacient'
  }


  isActivatedPatient() {

  }

  ngOnDestroy(): void {
    this.sub.unsubscribe();
  }

}
