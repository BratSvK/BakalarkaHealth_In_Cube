import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { DomSanitizer } from '@angular/platform-browser';
import { faPen } from '@fortawesome/free-solid-svg-icons';
import { ToastrService } from 'ngx-toastr';
import { PacientZdravotnaKartaDetail } from 'src/app/models/pacient/pacientZdravotnaKartaDetail';
import { extractFotoFromApi } from 'src/app/shared/foto-extract';
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



  get photoPatient(): any {
    if (this.patientDetail.fotka !== null) {
      return extractFotoFromApi(this.patientDetail.fotka, this.sanitizer);
    }
    return null;
  }

  get photoPractitioner(): any {
    if (this.patientDetail.vseobecnyLekar?.fotka !== null) {
      return extractFotoFromApi(this.patientDetail.vseobecnyLekar?.fotka, this.sanitizer);
    }
    return null;
  }

  constructor(
    private fb: FormBuilder,
    private healthRecordService: HealthRecordService,
    private healthRecordPatchService: HealthRecordPatchService,
    private toastr: ToastrService,
    private sanitizer: DomSanitizer) {
   }

  ngOnInit(): void {
    this.createForm();
    this.patientDetail = history.state.pacientDetail;
  }

  saveToPacient() {
    this.saveAvailable = false;
    const patchToApi = this.healthRecordPatchService.createPatch(this.patientDetail, this.patientForm.value);
    this.healthRecordService.updateHealthRecord(this.patientDetail.idPacient, {patchModel: patchToApi})
      .subscribe(() => {
        this.toastr.info('Pacientove údaje úspešné aktualizované.');
      }, err => {
        this.toastr.error('Nastala chyba pri aktualizácií údajov');
      });
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
