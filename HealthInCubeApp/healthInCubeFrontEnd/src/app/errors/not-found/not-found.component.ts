import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { map, take } from 'rxjs/operators';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { AppState } from 'src/app/_store/models/AppState';


@Component({
  selector: 'app-not-found',
  templateUrl: './not-found.component.html',
  styleUrls: ['./not-found.component.css']
})
export class NotFoundComponent implements OnInit {
  currentUser$: Observable<Pouzivatel>;

  constructor(private store: Store<AppState>) { 
    this.currentUser$ = this.store.select('auth').pipe(take(1), map(authData => {
      return authData.user;
    }))
  }

  ngOnInit(): void {
  }

}
