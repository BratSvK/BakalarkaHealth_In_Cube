import { Component, EventEmitter, Input, OnDestroy, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { DomSanitizer } from '@angular/platform-browser';
import { KrvnaSkupina, PacientZdravotnaKartaDetail } from 'src/app/models/pacient/pacientZdravotnaKartaDetail';
import { extractFotoFromApi } from 'src/app/shared/foto-extract';
import { SubSink } from 'subsink';

@Component({
  selector: 'app-health-record-patient-info',
  templateUrl: './health-record-patient-info.component.html',
  styleUrls: ['./health-record-patient-info.component.css']
})
export class HealthRecordPatientInfoComponent implements OnInit, OnDestroy {
  @Input() patientBaseData: PacientZdravotnaKartaDetail;

  @Output() listenToChanges: EventEmitter<string> = new EventEmitter<string>();

  patientDataForm: FormGroup;

  private subs = new SubSink();

  bloothGroupsOptions = [
    { label: 'A+',  value : KrvnaSkupina.A_P },
    { label: 'A-',  value : KrvnaSkupina.A_M },
    { label: 'AB+', value : KrvnaSkupina.AB_P },
    { label: 'AB-', value : KrvnaSkupina.AB_M },
    { label: 'B+',  value : KrvnaSkupina.B_P },
    { label: 'B-',  value : KrvnaSkupina.B_M },
    { label: '0+',  value : KrvnaSkupina.Z_P },
    { label: '0-',  value : KrvnaSkupina.Z_M },
  ]

  get photo(): any {
    if (this.patientBaseData.fotka !== null) {
      return extractFotoFromApi(this.patientBaseData.fotka, this.sanitizer);
    }
    return null;
  }

  constructor(
    private fb: FormBuilder,
    private sanitizer: DomSanitizer) {
   }
  ngOnDestroy(): void {
    this.subs.unsubscribe();
  }

  ngOnInit(): void {
    this.initPatientDataForm();
    this.listenToFormChange();
  }


  private initPatientDataForm() {
    this.patientDataForm = this.fb.group({
      patientName: [{value: this.patientBaseData.fullName, disabled: true}],
      email: [{value: this.patientBaseData.email, disabled: true}],
      krvSkupina: [this.patientBaseData.krvSkupina],
    });
  }

  private listenToFormChange() {
    this.subs.add(this.patientDataForm.get('krvSkupina').valueChanges.subscribe((krvSkupina: string) => {
      this.listenToChanges.emit(krvSkupina);
    }))
  }

}
