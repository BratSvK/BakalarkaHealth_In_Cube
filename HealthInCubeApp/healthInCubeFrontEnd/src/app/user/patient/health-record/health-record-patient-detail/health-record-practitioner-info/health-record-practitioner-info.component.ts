import { Component, Input, OnInit } from '@angular/core';
import { ClipboardService } from 'ngx-clipboard';
import { ToastrService } from 'ngx-toastr';
import { DoctorHealthRecord } from 'src/app/models/lekar/lekarZdravotnaKarta';
import { HealthRecordBaseInfo } from '../health-record-base-info/health-record-base-info.component';

@Component({
  selector: 'app-health-record-practitioner-info',
  templateUrl: './health-record-practitioner-info.component.html',
  styleUrls: ['./health-record-practitioner-info.component.css']
})
export class HealthRecordPractitionerInfoComponent extends HealthRecordBaseInfo implements OnInit {
  @Input() practitioner: DoctorHealthRecord;


  constructor(
    toastr: ToastrService,
    clipboardApi: ClipboardService
  ) {
    super(
      toastr, 
      clipboardApi);
  }

  ngOnInit(): void {
  }

}
