import { Component, HostListener, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Store } from '@ngrx/store';
import { map, take } from 'rxjs/operators';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { User } from 'src/app/models/user';
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

  user: Pouzivatel;

  constructor(private store: Store<AppState>) { }

  ngOnInit(): void {
    this.loadUser();
  }


  
   loadUser() {
    this.store.select('auth').pipe(take(1), map(userData => {
      return userData.user;
    })).subscribe(user => {
      this.user = user;
    });
  }

}
