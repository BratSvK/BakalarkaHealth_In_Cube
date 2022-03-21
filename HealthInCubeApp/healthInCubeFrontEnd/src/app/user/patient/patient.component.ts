import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { take, tap } from 'rxjs/operators';
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

  constructor(
    private store: Store<AppState>, 
    private patientService: PatientService,
    private router: Router,
    private activatedRoute: ActivatedRoute
  ) { 
    
  }
  
  ngOnInit(): void {
    this.isActivated$ = this.patientService.checkIsActiveted$();
    this.isActivated$.pipe(
      take(1),
      tap((a) => {
        if (a)
        this.router.navigate(['zdravotnaKarta'], {relativeTo:this.activatedRoute })
      })).subscribe();
  }

  ngOnDestroy(): void {
    this.store.dispatch(new PatientActionsBundle.ResetPatient());
  }
}
