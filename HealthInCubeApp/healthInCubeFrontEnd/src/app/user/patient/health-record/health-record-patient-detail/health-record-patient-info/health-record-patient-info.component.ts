import { formatDate } from '@angular/common';
import { Component, EventEmitter, FactoryProvider, Input, OnDestroy, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { KrvnaSkupina, PacientZdravotnaKartaDetail } from 'src/app/models/pacient/pacientZdravotnaKartaDetail';
import { SubSink } from 'subsink';

import { ToastrService } from 'ngx-toastr';
import { ClipboardService } from 'ngx-clipboard';
import { HealthRecordBaseInfo } from '../health-record-base-info/health-record-base-info.component';


@Component({
  selector: 'app-health-record-patient-info',
  templateUrl: './health-record-patient-info.component.html',
  styleUrls: ['./health-record-patient-info.component.css']
})
export class HealthRecordPatientInfoComponent extends HealthRecordBaseInfo implements OnInit, OnDestroy {
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

  constructor(
    private fb: FormBuilder,
    toastr: ToastrService,
    clipboardApi: ClipboardService
  ) {
    super(
      toastr, 
      clipboardApi);
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
      rodne: [{value: this.patientBaseData.bid, disabled: true}],
      datumNarodenia: [{value: formatDate(this.patientBaseData.datNarodenia, 'dd.MM.yyyy', 'en'), disabled: true}],
      miestoNarodenia: [{value: this.patientBaseData.mestoNarodenia, disabled: true}],
      krvSkupina: [this.patientBaseData.krvSkupina],
    });
  }

  private listenToFormChange() {
    this.subs.add(this.patientDataForm.get('krvSkupina').valueChanges.subscribe((krvSkupina: string) => {
      this.listenToChanges.emit(krvSkupina);
    }))
  }
}
