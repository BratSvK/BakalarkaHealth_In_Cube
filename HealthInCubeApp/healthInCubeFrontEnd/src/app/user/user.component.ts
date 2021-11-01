import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { map, take, tap } from 'rxjs/operators';
import { AppState } from '../_store/models/AppState';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  userId: number;
  constructor(private store: Store<AppState>) { 
    this.store.select('auth').pipe(take(1),map(userData => {
      return userData.user.id;
    })).subscribe(id => {
      this.userId = +id;
    })
  }

  ngOnInit(): void {
    
  }
  

}
