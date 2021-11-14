import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Store } from '@ngrx/store';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { AppState } from 'src/app/_store/models/AppState';

import * as AuthActionsBundle from '../../auth/store/auth.actions';


@Component({
  selector: 'app-nav-user-toolbox',
  templateUrl: './nav-user-toolbox.component.html',
  styleUrls: ['./nav-user-toolbox.component.css']
})
export class NavUserToolboxComponent implements OnInit {

  @Input() user: Pouzivatel;

  constructor(private store: Store<AppState>, private router: Router, private route: ActivatedRoute) { }

  ngOnInit(): void {
  }

  logout() {
    this.store.dispatch(new AuthActionsBundle.Logout());
  }

}
