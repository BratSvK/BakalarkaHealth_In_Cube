import { Component, Input, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { AppState } from 'src/app/_store/models/AppState';
import * as PatientActionsBundle from '../patient/store/patient.actions';

@Component({
  selector: 'app-patient',
  templateUrl: './patient.component.html',
  styleUrls: ['./patient.component.css']
})
export class PatientComponent implements OnInit {

  @Input() userId;
  isActivated$: Observable<boolean>;

  constructor(private store: Store<AppState>) { 
    
  }
 
  ngOnInit(): void {
    this.isActivated$ = this.store.select('patient').pipe(map(patientState => {
      return patientState.isActivated;
    }));

  }
}
