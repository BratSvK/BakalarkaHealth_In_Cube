import { Component, OnDestroy, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable, Subscription } from 'rxjs';
import { map, switchMap, take, tap, withLatestFrom } from 'rxjs/operators';
import { PacientCard } from 'src/app/models/pacientCard';
import {
  DEFUALT_ITEMS_PER_PAGE,
  DEFUALT_PAGE_NUMBER,
  Pagination,
} from 'src/app/models/pagination';
import { LekarIdService } from 'src/app/_service/lekar.service';
import { PatientsService } from 'src/app/_service/patients.service';
import { AppState, lekarId } from 'src/app/_store/models/AppState';

@Component({
  selector: 'app-pacienti-list',
  templateUrl: './pacienti-list.component.html',
  styleUrls: ['./pacienti-list.component.css'],
})
export class PacientiListComponent implements OnInit, OnDestroy {
  patients: PacientCard[];
  pagination: Pagination;
  pageNumber = DEFUALT_PAGE_NUMBER;
  pageSize = DEFUALT_ITEMS_PER_PAGE;

  sub: Subscription;

  constructor(
    private patientService: PatientsService,
    private lekarIdService: LekarIdService
  ) {}

  ngOnInit(): void {
    this.loadPatients();
  }

  ngOnDestroy(): void {
    if (this.sub) this.sub.unsubscribe();
  }

  pageChanged(event: any) {
    this.pageNumber = event.page;
    this.loadPatients();
  }

  private loadPatients() {
    // httpResponse is typical complete call don't need unsub
    var lekarId = this.lekarIdService.getLekarId();
    if (!!lekarId === false) {
      this.sub = this.patientService
        .getDoctorIdByUserId()
        .pipe(
          switchMap((lekarId) =>
            this.patientService.getPatientsByDoctorId(
              lekarId,
              this.pageNumber,
              this.pageSize
            )
          )
        )
        .subscribe((response) => {
          this.patients = response.result;
          this.pagination = response.pagination;
        });
    } else {
      this.patientService
        .getPatientsByDoctorId(lekarId, this.pageNumber, this.pageSize)
        .subscribe((response) => {
          this.patients = response.result;
          this.pagination = response.pagination;
        });
    }
  }
}
