import { Injectable } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { getCurrentUserState } from '../auth/store/modelStore/AuthState';
import { Pouzivatel } from '../models/pouzivatel';
import { AppState } from '../_store/models/AppState';

@Injectable({
  providedIn: 'root'
})
export class UcetService {

  constructor(private store: Store<AppState>) {}


  get currentUser$() : Observable<Pouzivatel> {
    return this.store.select(getCurrentUserState);
  }

}
