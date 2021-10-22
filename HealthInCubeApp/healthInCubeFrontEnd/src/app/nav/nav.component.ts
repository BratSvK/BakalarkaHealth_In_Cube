import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { map, take } from 'rxjs/operators';
import { Pouzivatel } from '../models/pouzivatel';
import { AppState } from '../_store/models/AppState';
import * as AuthActionsBundle from '../auth/store/auth.actions';


@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.css']
})
export class NavComponent implements OnInit {

  user: Pouzivatel;

  constructor(private store: Store<AppState>) { }

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
