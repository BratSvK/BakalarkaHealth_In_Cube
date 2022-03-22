import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { VykVysetrenie } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/vykonaneVysetrenia';

@Component({
  selector: 'app-health-record-vysetrenia-edit',
  templateUrl: './health-record-vysetrenia-edit.component.html',
  styleUrls: ['./health-record-vysetrenia-edit.component.css']
})
export class HealthRecordVysetreniaEditComponent implements OnInit {
  @Output() isClicked = new EventEmitter<number>();
  @Input() vysetrenie: VykVysetrenie;

  vysetrenieForm: FormGroup;


  constructor(private fb: FormBuilder) { }

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
}
