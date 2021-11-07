import { AfterContentInit, Component, Input, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { take } from 'rxjs/operators';
import { AppState } from 'src/app/_store/models/AppState';
import * as PatientActionsBundle from '../patient/store/patient.actions';


@Component({
  selector: 'app-patient',
  templateUrl: './patient.component.html',
  styleUrls: ['./patient.component.css']
})
export class PatientComponent implements OnInit {

  @Input() userId;
  isActivated = false;


  constructor(private store: Store<AppState>) { 
  }

  ngOnInit(): void {
    this.store.dispatch(new PatientActionsBundle.IsActivated(this.userId));

    this.store.select('patient').pipe(take(1)).subscribe(patientData => {
      this.isActivated = patientData.isActivated;
    });

    console.log(this.isActivated);
  }

  

}
