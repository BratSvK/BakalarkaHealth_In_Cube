import { Component, OnInit } from '@angular/core';
import { ZapChoroba } from 'src/app/models/pacient/zdravotnaKarta/zapChoroby/zapChoroby';

@Component({
  selector: 'app-health-record-patient-choroby',
  templateUrl: './health-record-patient-choroby.component.html',
  styleUrls: ['./health-record-patient-choroby.component.css']
})
export class HealthRecordPatientChorobyComponent implements OnInit {
  chorobyZoznam: ZapChoroba[] = [];

  constructor() { }

  ngOnInit(): void {
    this.chorobyZoznam = history.state.choroby;
  }

}
