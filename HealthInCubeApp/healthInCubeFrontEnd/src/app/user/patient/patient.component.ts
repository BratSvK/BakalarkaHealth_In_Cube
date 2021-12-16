import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { PatientService } from 'src/app/_service/patient.service';
import { AppState } from 'src/app/_store/models/AppState';
import * as PatientActionsBundle from '../patient/store/patient.actions';

@Component({
  selector: 'app-patient',
  templateUrl: './patient.component.html',
  styleUrls: ['./patient.component.css']
})
export class PatientComponent implements OnInit, OnDestroy {

  @Input() userId;
  isActivated$: Observable<boolean>;

  constructor(private store: Store<AppState>, private patientService: PatientService) { 
    
  }
  
  ngOnInit(): void {
    this.isActivated$ = this.patientService.checkIsActiveted$();
  }

  ngOnDestroy(): void {
    this.store.dispatch(new PatientActionsBundle.ResetPatient());
  }
}
