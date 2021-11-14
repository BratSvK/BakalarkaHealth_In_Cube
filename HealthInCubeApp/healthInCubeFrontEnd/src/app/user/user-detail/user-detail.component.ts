import { Component, OnInit } from '@angular/core';
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

  user: Pouzivatel;

  constructor(private store: Store<AppState>) { }

  ngOnInit(): void {
    this.store.select('auth').pipe(take(1), map(userData => {
      return userData.user;
    })).subscribe(user => {
      this.user = user;
    });

    console.log(this.user);
  }

}
