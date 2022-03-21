import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { AppState } from './_store/models/AppState';
import * as AuthActionBundle from '../app/auth/store/auth.actions';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'HealthInCubeFrontEnd';

  constructor(private store: Store<AppState>) {}

  ngOnInit(): void {
    this.store.dispatch(new AuthActionBundle.AutoLogin());
  }
}
