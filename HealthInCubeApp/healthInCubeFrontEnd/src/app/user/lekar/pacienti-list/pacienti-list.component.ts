import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { switchMap } from 'rxjs/operators';
import { LekarParams } from 'src/app/models/lekar/lekarParams';
import { PacientCard } from 'src/app/models/pacientCard';
import {
  Pagination
} from 'src/app/models/pagination';
import { LekarIdService } from 'src/app/_service/lekar-id.service';
import { LekarService } from 'src/app/_service/lekar.service';
import { PatientService } from 'src/app/_service/patient.service';

@Component({
  selector: 'app-pacienti-list',
  templateUrl: './pacienti-list.component.html',
  styleUrls: ['./pacienti-list.component.css'],
})
export class PacientiListComponent implements OnInit, OnDestroy {
  patients: PacientCard[];
  pagination: Pagination;
  lekarParams: LekarParams;

  sub: Subscription;

  constructor(
    private patientService: PatientService,
    private lekarIdService: LekarIdService,
    private lekarService: LekarService
  ) {
    this.lekarParams = new LekarParams();
  }

  ngOnInit(): void {
    this.loadPatients();
  }

  ngOnDestroy(): void {
    if (this.sub) this.sub.unsubscribe();
  }

  pageChanged(event: any) {
    this.lekarParams.pageNumber = event.page;
    this.loadPatients();
  }


  resetFilter() {
    this.lekarParams = new LekarParams();
    this.loadPatients();
  }

  loadPatients() {
    // httpResponse is typical complete call don't need unsub
    var lekarId = this.lekarIdService.getLekarId();
    if (!!lekarId === false) {
      this.sub = this.lekarService
        .getDoctorIdByUserId()
        .pipe(
          switchMap((lekarId) =>
            this.patientService.getPatientsByDoctorId(
              lekarId,
              this.lekarParams
            ))
        )
        .subscribe((response) => {
          this.patients = response.result;
          this.pagination = response.pagination;
        });
    } else {
      this.patientService
        .getPatientsByDoctorId(lekarId, this.lekarParams)
        .subscribe((response) => {
          this.patients = response.result;
          this.pagination = response.pagination;
        });
    }
  }
}
