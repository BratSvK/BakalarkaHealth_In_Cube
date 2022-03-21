import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { ZdravotnaKarta } from 'src/app/models/pacient/zdravotnaKarta/zdravotnaKarta';
import { AccountType } from 'src/app/shared/auth-common';
import { getTypeOfAccount } from 'src/app/shared/common';
import { HealthRecordService } from 'src/app/_service/health-record.service';

@Component({
  selector: 'app-health-record-shell',
  templateUrl: './health-record-shell.component.html',
  styleUrls: ['./health-record-shell.component.css']
})
export class HealthRecordShellComponent implements OnInit, OnDestroy {
  healthRecord$: Observable<ZdravotnaKarta>;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private healthRecordService: HealthRecordService
  ) {
   }
  ngOnDestroy(): void {
    if (getTypeOfAccount(this.router) === AccountType.doctor) {
      this.healthRecordService.clearHealthRecordCache();
    }
  }
 
  ngOnInit(): void {
    this.loadCurrentHealthRecordFromResolver();
  }

  private loadCurrentHealthRecordFromResolver() {
    this.healthRecord$ = this.route.data.pipe(
      map((data) => {
        return data.healthRecord;
      })
    );
  }
}
