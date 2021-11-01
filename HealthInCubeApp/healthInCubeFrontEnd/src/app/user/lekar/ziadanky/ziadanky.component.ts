import { Component, OnDestroy, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Subscription } from 'rxjs';
import { map, take } from 'rxjs/operators';
import { Ziadanka } from 'src/app/models/ziadanka';
import { AppState } from 'src/app/_store/models/AppState';
import { faCheck } from '@fortawesome/free-solid-svg-icons';

import * as LekarActionsBundle from '../store/lekar.actions';

@Component({
  selector: 'app-ziadanky',
  templateUrl: './ziadanky.component.html',
  styleUrls: ['./ziadanky.component.css']
})
export class ZiadankyComponent implements OnInit, OnDestroy {

  checkIcon = faCheck;

  requests: Ziadanka[] = [];
  ziadankaSub: Subscription;

  constructor(private store: Store<AppState>) { 
    this.store.dispatch(new LekarActionsBundle.FetchRequests());
  }
  

  ngOnInit(): void {

    this.store.select('lekar').pipe(
      map(lekarData => {
        return lekarData.ziadanky;
      })
    ).subscribe(ziadanky => {
      this.requests = ziadanky;
    });

  }



  onApprovePatient(idUser: number) {

    console.log(`lets create user with id: ${idUser}`);
  }

  ngOnDestroy(): void {
    
  }
}
