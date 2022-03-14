import { Component, OnInit } from '@angular/core';
import { faPlus } from '@fortawesome/free-solid-svg-icons';
import { VykVysetrenia } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/vykonaneVysetrenia';


@Component({
  selector: 'app-health-record-patient-vysetrenia',
  templateUrl: './health-record-patient-vysetrenia.component.html',
  styleUrls: ['./health-record-patient-vysetrenia.component.css']
})
export class HealthRecordPatientVysetreniaComponent implements OnInit {
  vysetreniaZoznam: VykVysetrenia[] = [];
  addIcon = faPlus;
  
  constructor() { }

  ngOnInit(): void {
    this.vysetreniaZoznam = history.state.pacientVysetrenia;
  }

}
