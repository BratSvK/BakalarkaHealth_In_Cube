import { Component, OnDestroy, OnInit } from '@angular/core';
import { faPlus } from '@fortawesome/free-solid-svg-icons';
import { VykVysetrenie } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/vykonaneVysetrenia';
import { HealthRecordService } from 'src/app/_service/health-record.service';


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
  
  constructor(private healthRecordService: HealthRecordService) { }

  ngOnDestroy(): void {
  }

  ngOnInit(): void {
    this.vysetreniaZoznam = history.state.pacientVysetrenia;
  }

  setCreatedMode() {
    this.isCreateMode = true;
  }

  addToVysetreniList(vysetrenie: VykVysetrenie) {
    if(!!vysetrenie)
    var newVysetrenieZoznam = [{...vysetrenie}, ...this.vysetreniaZoznam];
    this.vysetreniaZoznam = newVysetrenieZoznam;
    this.healthRecordService.vysetreniaAfterCreate$.emit(newVysetrenieZoznam);
  }

  fromEditView($event) {
    this.isViewModeVysetrenieId = $event
  }
}
