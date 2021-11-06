import { Component, OnDestroy, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Subscription } from 'rxjs';
import { map, take } from 'rxjs/operators';
import { Ziadanka } from 'src/app/models/ziadanka';
import { AppState } from 'src/app/_store/models/AppState';
import { faCheck } from '@fortawesome/free-solid-svg-icons';

import * as LekarActionsBundle from '../store/lekar.actions';
import { CreatePatient } from 'src/app/models/createPatient';

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

   this.ziadankaSub =  this.store.select('lekar').pipe(
      map(lekarData => {
        return lekarData.ziadanky;
      })
    ).subscribe(ziadanky => {
      this.requests = ziadanky;
    });

  }



  onApprovePatient(idUser: number) {
    var createPatienModel = this.createModelToCreationPatient(idUser);
    this.store.dispatch(new LekarActionsBundle.AcceptRequest(createPatienModel));
  }

  private createModelToCreationPatient(idUser: number): CreatePatient {
    return {
      idLekar: this.getLekarId(),
      idUser: idUser
    };
  }

  private getLekarId(): number {
    let lekarId: number;

    this.store.select('lekar').pipe(take(1), map(lekarData => {
      return lekarData.practitioner.idLekar;
    })).subscribe(id => {
      lekarId = id;
    });

    return lekarId;
  }

  ngOnDestroy(): void {
    if (this.ziadankaSub)
    this.ziadankaSub.unsubscribe();
  }
}
