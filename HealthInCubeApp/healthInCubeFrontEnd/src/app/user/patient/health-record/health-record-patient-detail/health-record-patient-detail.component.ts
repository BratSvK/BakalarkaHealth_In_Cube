import { Component, OnInit } from '@angular/core';
import { faPen } from '@fortawesome/free-solid-svg-icons';
import { PouzivatelZdravotnaKarta } from 'src/app/models/pouzivatel/pouzivatelZdravotnaKarta';


@Component({
  selector: 'app-health-record-patient-detail',
  templateUrl: './health-record-patient-detail.component.html',
  styleUrls: ['./health-record-patient-detail.component.css']
})
export class HealthRecordPatientDetailComponent implements OnInit {
  patientDetail: PouzivatelZdravotnaKarta;
  pen = faPen;

  constructor() {
    
   }

  ngOnInit(): void {
    this.patientDetail = history.state.pouzivatel;
  }

}
