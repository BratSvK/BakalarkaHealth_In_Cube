// import { Component, OnDestroy, OnInit } from '@angular/core';
// import { Store } from '@ngrx/store';
// import { map, take } from 'rxjs/operators';
// import { Pouzivatel } from '../models/pouzivatel';
// import { AppState } from '../_store/models/AppState';
// import * as AuthActionsBundle from '../auth/store/auth.actions';
// import { Subscription } from 'rxjs';
// import { faUserCheck, faStethoscope, faUsers } from '@fortawesome/free-solid-svg-icons';



// @Component({
//   selector: 'app-nav',
//   templateUrl: './nav.component.html'
// })
// export class NavComponent implements OnInit, OnDestroy {

//   isCollapsed = false;
//   user: Pouzivatel;
//   isActivatedPatientFlag: boolean;
//   image: any;

//   users = faUsers;
//   userCheck = faUserCheck;
//   stethoscope = faStethoscope;


//   sub: Subscription;

//   constructor(private store: Store<AppState>) { }
 

//   ngOnInit(): void {
    
//     this.store.select('auth').pipe(take(1),map(resData => {
//       return resData.user;
//     })).subscribe(user => {
//       this.user = user;
//     });


//   }


//   logout() {
//     this.store.dispatch(new AuthActionsBundle.Logout());
//   }


//   isPatient() {
//    return this.user.roleStoreBase[0].trim().toLowerCase() === 'pacient'
//   }


//   isActivatedPatient() {

//   }

//   ngOnDestroy(): void {
//     this.sub.unsubscribe();
//   }

// }
