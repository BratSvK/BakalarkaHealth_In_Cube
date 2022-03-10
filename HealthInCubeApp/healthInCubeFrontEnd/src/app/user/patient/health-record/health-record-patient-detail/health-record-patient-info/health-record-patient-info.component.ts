import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { PouzivatelZdravotnaKarta } from 'src/app/models/pouzivatel/pouzivatelZdravotnaKarta';

@Component({
  selector: 'app-health-record-patient-info',
  templateUrl: './health-record-patient-info.component.html',
  styleUrls: ['./health-record-patient-info.component.css']
})
export class HealthRecordPatientInfoComponent implements OnInit {
  @Input() patientBaseData: PouzivatelZdravotnaKarta;

  patientDataForm: FormGroup;

  constructor(private fb: FormBuilder) {
   }

  ngOnInit(): void {
    console.log(this.patientBaseData);
    this.initPatientDataForm();

  }


  private initPatientDataForm() {
    this.patientDataForm = this.fb.group({
      patientName: [{value: this.patientBaseData.fullName, disabled: true}],
    });
  }

}
