import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Store } from '@ngrx/store';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { AuthService } from 'src/app/_service/auth.service';
import { AppState } from 'src/app/_store/models/AppState';

import * as AuthActionsBundle from '../../auth/store/auth.actions';


@Component({
  selector: 'app-nav-user-toolbox',
  templateUrl: './nav-user-toolbox.component.html',
  styleUrls: ['./nav-user-toolbox.component.css']
})
export class NavUserToolboxComponent implements OnInit {

  @Input() user: Pouzivatel;
  @Output() clearAdminCache = new EventEmitter<boolean>();

  constructor(
    private store: Store<AppState>,
    private authService: AuthService
  ) { }

  get isUserAsAdmin() {
    return this.authService.chechIfUserIsAdmin(this.user);
  }

  ngOnInit(): void {
  }

  logout() {
    this.chechIfItAdminAndClearCache();
    this.store.dispatch(new AuthActionsBundle.Logout());
  }

  private chechIfItAdminAndClearCache() {
    if (this.isUserAsAdmin){
      this.clearAdminCache.emit(true);
    }
  }
}
