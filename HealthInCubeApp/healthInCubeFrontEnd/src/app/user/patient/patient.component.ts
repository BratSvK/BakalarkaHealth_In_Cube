import { Component, Input, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { AppState } from 'src/app/_store/models/AppState';
import * as PatientActionsBundle from '../patient/store/patient.actions';


@Component({
  selector: 'app-patient',
  templateUrl: './patient.component.html',
  styleUrls: ['./patient.component.css']
})
export class PatientComponent implements OnInit {

  @Input() userId;


  constructor(private store: Store<AppState>) { 
    
  }

  ngOnInit(): void {
   this.store.dispatch(new PatientActionsBundle.IsActivated(this.userId));
  }

}
