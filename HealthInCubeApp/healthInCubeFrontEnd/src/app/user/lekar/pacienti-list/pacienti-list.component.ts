import { Component, OnDestroy, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable, Subscription } from 'rxjs';
import { map, switchMap, take, tap } from 'rxjs/operators';
import { PacientCard } from 'src/app/models/pacientCard';
import { Pagination } from 'src/app/models/pagination';
import { LekarIdService } from 'src/app/_service/lekar.service';
import { PatientsService } from 'src/app/_service/patients.service';
import { AppState, lekarId } from 'src/app/_store/models/AppState';

@Component({
  selector: 'app-pacienti-list',
  templateUrl: './pacienti-list.component.html',
  styleUrls: ['./pacienti-list.component.css']
})
export class PacientiListComponent implements OnInit, OnDestroy {

  patients: PacientCard[];
  pagination: Pagination;
  pageNumber = 1;
  pageSize = 5;

  sub: Subscription;


  constructor(private patientService: PatientsService, private lekarIdService: LekarIdService) {
  }
 
  ngOnInit(): void {
    this.loadPatients();
  }

  ngOnDestroy(): void {
    if (this.sub)
    this.sub.unsubscribe();
  }

  private loadPatients() {
    // httpResponse is typical complete call don't need unsub
    var lekarId = this.lekarIdService.getLekarId();
    if (!!lekarId === false) {
     this.sub = this.patientService.getDoctorIdByUserId().subscribe(lekarIdResponse => {
      this.patientService.getPatientsByDoctorId(lekarIdResponse, this.pageNumber, this.pageSize).subscribe( response => {
        this.patients = response.result;
        this.pagination = response.pagination
      });
     });
    }

    this.patientService.getPatientsByDoctorId(lekarId, this.pageNumber, this.pageSize).subscribe( response => {
      this.patients = response.result;
      this.pagination = response.pagination
    });
    
  }
}
