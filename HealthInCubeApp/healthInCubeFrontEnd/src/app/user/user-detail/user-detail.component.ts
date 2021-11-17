import { Component, HostListener, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { map, take } from 'rxjs/operators';
import { Bydlisko } from 'src/app/models/bydlisko';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { PouzivatelDetail } from 'src/app/models/pouzivatel-detail';
import { AppState } from 'src/app/_store/models/AppState';

@Component({
  selector: 'app-user-detail',
  templateUrl: './user-detail.component.html',
  styleUrls: ['./user-detail.component.css']
})
export class UserDetailComponent implements OnInit {


  @ViewChild('editForm') editForm: NgForm;

  // before bvrowser closed 
  @HostListener('window:beforeunload', ['$event']) unloadNotification($event: any){
    if (this.editForm.dirty){
      $event.returnValue = true;
    }
  }

  user: PouzivatelDetail;
  userAuth$ : Observable<Pouzivatel>;

  constructor(private store: Store<AppState>) { 
    this.userAuth$ = this.store.select('auth').pipe(take(1), map(userAuth => {
      return userAuth.user;
    }));
  }

  ngOnInit(): void {
    this.loadUser();
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
    if (bydliskos.length <= 0) {
      return undefined;
    }
    return bydliskos.filter(b => b.trvale === true)[0].idMestoNavigation.nazov;
  }


  getAgeByBirthDate(datNarodenia: Date): number {
   
    let timeDiff = Math.abs(Date.now() - new Date(datNarodenia).getTime());
    let age = Math.floor((timeDiff / (1000 * 3600 * 24))/365.25); 
    return age;
  }

}
