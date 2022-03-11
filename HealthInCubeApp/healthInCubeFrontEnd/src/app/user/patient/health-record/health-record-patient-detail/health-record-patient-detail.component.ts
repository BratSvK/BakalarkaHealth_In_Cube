import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { DomSanitizer } from '@angular/platform-browser';
import { faPen } from '@fortawesome/free-solid-svg-icons';
import { PacientZdravotnaKartaDetail } from 'src/app/models/pacient/pacientZdravotnaKartaDetail';
import { HealthRecordPatchService } from 'src/app/_service/health-record-patch.service';
import { HealthRecordService } from 'src/app/_service/health-record.service';


@Component({
  selector: 'app-health-record-patient-detail',
  templateUrl: './health-record-patient-detail.component.html',
  styleUrls: ['./health-record-patient-detail.component.css']
})
export class HealthRecordPatientDetailComponent implements OnInit {
  patientDetail: PacientZdravotnaKartaDetail;
  pen = faPen;
  saveAvailable =  false;
  patientForm: FormGroup;

  constructor(
    private fb: FormBuilder,
    private healthRecordService: HealthRecordService,
    private healthRecordPatchService: HealthRecordPatchService) {
   }

  ngOnInit(): void {
    this.createForm();
    this.patientDetail = history.state.pacientDetail;
    console.log(this.patientDetail);
  }

  saveToPacient() {
    console.log(this.patientForm.value);
    this.saveAvailable = false;
    const patchToApi = this.healthRecordPatchService.createPatch(this.patientDetail, this.patientForm.value);
    this.healthRecordService.updateHealthRecord(this.patientDetail.idPacient, {replace: patchToApi});
  }

  setDetailPatientFormValues($event) {
    this.saveAvailable = true;
    this.patientForm.patchValue({ krvSkupina: $event });
  }

  private createForm() {
    this.patientForm = this.fb.group({
      krvSkupina: ''
    });
  }

}
