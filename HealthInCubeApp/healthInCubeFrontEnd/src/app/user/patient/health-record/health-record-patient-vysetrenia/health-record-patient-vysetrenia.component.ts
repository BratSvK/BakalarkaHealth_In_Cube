import { Component, OnDestroy, OnInit } from '@angular/core';
import { faPlus } from '@fortawesome/free-solid-svg-icons';
import { VykVysetrenie } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/vykonaneVysetrenia';
import { HealthRecordVysetrenieService } from 'src/app/_service/health-record-vysetrenie.service';
import { SubSink } from 'subsink';


@Component({
  selector: 'app-health-record-patient-vysetrenia',
  templateUrl: './health-record-patient-vysetrenia.component.html',
  styleUrls: ['./health-record-patient-vysetrenia.component.css']
})
export class HealthRecordPatientVysetreniaComponent implements OnInit, OnDestroy {
  vysetreniaZoznam: VykVysetrenie[] = [];
  addIcon = faPlus;
  isCreateMode = false;
  isViewModeVysetrenieId = -1;
  
  constructor() { }

  ngOnDestroy(): void {
  }

  ngOnInit(): void {
    this.vysetreniaZoznam = history.state.pacientVysetrenia;
  }

  setCreatedMode() {
    this.isCreateMode = true;
  }

  fromEditView($event) {
    this.isViewModeVysetrenieId = $event
  }
}
