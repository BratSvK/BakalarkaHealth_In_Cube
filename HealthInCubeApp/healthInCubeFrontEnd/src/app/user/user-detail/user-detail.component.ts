import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { map, take} from 'rxjs/operators';
import { Bydlisko } from 'src/app/models/bydlisko';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { PouzivatelDetail } from 'src/app/models/pouzivatel-detail';
import { AppState } from 'src/app/_store/models/AppState';

import * as UserDetailActionsBundle from './store/user-detail.actions';

@Component({
  selector: 'app-user-detail',
  templateUrl: './user-detail.component.html',
  styleUrls: ['./user-detail.component.css']
})
export class UserDetailComponent implements OnInit {

  user: PouzivatelDetail;
  userAuth$ : Observable<Pouzivatel>;
  bydliska$: Observable<Bydlisko[]>;

  constructor(private store: Store<AppState>) { 
    this.userAuth$ = this.store.select('auth').pipe(take(1), map(userAuth => {
      return userAuth.user;
    }));
  }

  ngOnInit(): void {
    this.bydliska$ = this.store.select('userDetail').pipe(map(userDetail => {
      return userDetail.bydliska;
    }));

    this.loadUser();
  }

  onEditItem(index: number) {
    //  this.shoppingService.startedEditing.next(index);
    this.store.dispatch(new UserDetailActionsBundle.StartEdit(index));
  }

  checkGetTrvale(bydlisko: Bydlisko): Observable<boolean> {
    return this.bydliska$.pipe(
      map((bydliska: Bydlisko[]) => {
        return bydliska.filter(b => b.idBydliska == bydlisko.idBydliska ?? -1)[0].trvale
      }));
  }

   getLastActive(poslednePrihlasenie: Date) {
    const userDateLastActive = new Date(poslednePrihlasenie);
    var userTimezoneOffset = userDateLastActive.getTimezoneOffset() * 60000;
    const localTime = new Date(userDateLastActive.getTime() - (-userTimezoneOffset));
    return localTime;
  }

  isPacient(user: Pouzivatel) {
    return user.roleStoreBase.includes("Pacient");
  }
  
   loadUser() {
    this.store.select('userDetail').pipe(take(1), map(userData => {
      return userData.userDetail;
    })).subscribe(user => {
      this.user = user;
    });
   }

  getLivingCity(bydliskos: Bydlisko[]): string {
    const nikde: string = "NEZNÁME";
    if (bydliskos.length <= 0) {
      return nikde;
    }
    const mesto = bydliskos.filter(b => b.trvale === true)[0];
    if (mesto) {
      return mesto.idMestoNavigation.nazov;
    } 
    return nikde;
  }


  getAgeByBirthDate(datNarodenia: Date): number {
   
    let timeDiff = Math.abs(Date.now() - new Date(datNarodenia).getTime());
    let age = Math.floor((timeDiff / (1000 * 3600 * 24))/365.25); 
    return age;
  }

}
