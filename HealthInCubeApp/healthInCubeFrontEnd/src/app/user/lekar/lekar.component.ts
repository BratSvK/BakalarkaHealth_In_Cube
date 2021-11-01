import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { AppState } from 'src/app/_store/models/AppState';

import * as LekarActionsBundle from './store/lekar.actions';

@Component({
  selector: 'app-lekar',
  templateUrl: './lekar.component.html',
  styleUrls: ['./lekar.component.css']
})
export class LekarComponent implements OnInit {

  constructor(private store: Store<AppState>) { 
    this.store.dispatch(new LekarActionsBundle.FetchPractitioner());
  }

  ngOnInit(): void {
  }

}
