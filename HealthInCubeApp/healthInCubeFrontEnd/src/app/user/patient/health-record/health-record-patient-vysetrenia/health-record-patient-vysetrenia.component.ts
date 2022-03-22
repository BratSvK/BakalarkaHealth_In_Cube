import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { faPlus } from '@fortawesome/free-solid-svg-icons';
import { VykVysetrenie } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/vykonaneVysetrenia';


@Component({
  selector: 'app-health-record-patient-vysetrenia',
  templateUrl: './health-record-patient-vysetrenia.component.html',
  styleUrls: ['./health-record-patient-vysetrenia.component.css']
})
export class HealthRecordPatientVysetreniaComponent implements OnInit {
  vysetreniaZoznam: VykVysetrenie[] = [];
  addIcon = faPlus;
  isCreateMode = false;
  isViewModeVysetrenieId = -1;
  constructor(private router: Router) { }

  ngOnInit(): void {
    this.vysetreniaZoznam = history.state.pacientVysetrenia;
  }

  setCreatedMode() {
    this.isCreateMode = true;
  }

}
