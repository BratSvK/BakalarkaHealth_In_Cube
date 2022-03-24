import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { VykVysetrenie } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/vykonaneVysetrenia';
import { HealthRecordVysetrenieService } from 'src/app/_service/health-record-vysetrenie.service';
import { faPrescriptionBottleAlt } from '@fortawesome/free-solid-svg-icons';


@Component({
  selector: 'app-health-record-vysetrenia-edit',
  templateUrl: './health-record-vysetrenia-edit.component.html',
  styleUrls: ['./health-record-vysetrenia-edit.component.css']
})
export class HealthRecordVysetreniaEditComponent implements OnInit {
  @Output() isClicked = new EventEmitter<number>();
  @Input() vysetrenie: VykVysetrenie;

  prescriptionIcon = faPrescriptionBottleAlt;
  vysetrenieForm: FormGroup;


  constructor(
    private fb: FormBuilder,
    private healthRecordVysetrenieService: HealthRecordVysetrenieService
  ) { }

  ngOnInit(): void {
    this.initVysetrenieForm();
  }


  private initVysetrenieForm() {
    this.vysetrenieForm = this.fb.group({
      doctorExamination: [{value: this.vysetrenie.menoVysetrujuciLekar, disabled: true}],
      dateExamination: [{value: new Date(this.vysetrenie.datumVys).toLocaleString(), disabled: true}],
      vysledok: [{value: this.vysetrenie.vysledok, disabled: true}],
      typVysetrenia: [{value: this.vysetrenie.typVysetreniaNazov, disabled: true}],
    });
  }

  downloadAttachemntZip() {
    this.healthRecordVysetrenieService.downloadAttacmentStarted$.emit(this.vysetrenie.idVysetrenie);
  }
}
