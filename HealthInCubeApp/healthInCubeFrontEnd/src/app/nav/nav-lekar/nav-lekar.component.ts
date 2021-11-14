import { Component, OnInit } from '@angular/core';
import { faStethoscope, faUserCheck, faUsers } from '@fortawesome/free-solid-svg-icons';
import { Store } from '@ngrx/store';
import { map, take } from 'rxjs/operators';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { AppState } from 'src/app/_store/models/AppState';



@Component({
  selector: 'app-nav-lekar',
  templateUrl: './nav-lekar.component.html',
  styleUrls: ['./nav-lekar.component.css']
})
export class NavLekarComponent implements OnInit {

  isCollapsed = false;
  user: Pouzivatel;
  isActivatedPatientFlag: boolean;
  image: any;

  users = faUsers;
  userCheck = faUserCheck;
  stethoscope = faStethoscope;

  constructor(private store: Store<AppState>) { }

  ngOnInit(): void {
    this.store.select('auth').pipe(take(1),map(resData => {
      return resData.user;
    })).subscribe(user => {
      this.user = user;
    });
  }






}
