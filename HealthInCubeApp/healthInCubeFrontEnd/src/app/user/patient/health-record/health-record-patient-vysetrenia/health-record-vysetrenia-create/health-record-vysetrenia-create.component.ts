import { Component, EventEmitter, OnDestroy, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { faCaretRight, faPen, faTrash, faDiagnoses, faProcedures, faFilePrescription } from '@fortawesome/free-solid-svg-icons';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { debounceTime, distinctUntilChanged, filter, switchMap, tap } from 'rxjs/operators';
import { LekarTypAtestacie } from 'src/app/models/lekar/atestacia/atestaciaLekarType';
import { PacientCard } from 'src/app/models/pacient/pacientCard';
import { Choroba } from 'src/app/models/pacient/zdravotnaKarta/zapChoroby/choroba';
import { getPractitionerAtestationsTypes, getPractitionorIdState } from 'src/app/user/lekar/store/modelStore/LekarState';
import { HealthRecordVysetrenieService } from 'src/app/_service/health-record-vysetrenie.service';
import { HealthRecordService } from 'src/app/_service/health-record.service';
import { AppState } from 'src/app/_store/models/AppState';
import { SubSink } from 'subsink';

@Component({
  selector: 'app-health-record-vysetrenia-create',
  templateUrl: './health-record-vysetrenia-create.component.html',
  styleUrls: ['./health-record-vysetrenia-create.component.css']
})
export class HealthRecordVysetreniaCreateComponent implements OnInit, OnDestroy {
  @Output() leaveCreateMode: EventEmitter<boolean> = new EventEmitter<boolean>();

  vysetrenieCreateForm: FormGroup;
  deleteIcon = faTrash;
  pen = faPen;
  diagnoseIcon = faDiagnoses;
  proceduresIcon = faProcedures;
  recipeIcon = faFilePrescription;
  pacientDetail: PacientCard;
  practitionerId: number;
  practitionerTypes$: Observable<LekarTypAtestacie[]>;
  chorobaZoznamBySearch$: Observable<Choroba[]>;
  chorobaTitle = "Zapísať chorobu";
  liecbaTitle = "Predpísať liečbu";
  receptTitle = "Predpísať recept";

  selectedChoroba: string = "nevybraná";

  caretIcon = faCaretRight;

  private subs = new SubSink();

  constructor(
    private fb: FormBuilder,
    private healthRecordVysetrenieService: HealthRecordVysetrenieService,
    private healthRecordService: HealthRecordService,
    private store: Store<AppState>
  ) {
      this.loadPatientDetial();
      this.listenToPractitionerIdFromStore();
    }

  onSelected(choroba: Choroba) {
    this.selectedChoroba = choroba.nazov;
    this.vysetrenieCreateForm.get('zapChoroba.cisChoroba').setValue(choroba.cisChoroba);
  }

  ngOnDestroy(): void {
    this.subs.unsubscribe();
  }

  ngOnInit(): void {
    this.initCreateForm();
  }

  onLeaveCrateMode() {
    this.leaveCreateMode.emit(false);
  }

  createVystrenie() {
    console.log(this.vysetrenieCreateForm.value);
  }

  selectTypeInfo() {

  }

  onFileChange(event) {
    let reader = new FileReader();
    if(event.target.files && event.target.files.length) {
      const [file] = event.target.files;
      reader.readAsDataURL(file);
      reader.onload = () => {
        this.vysetrenieCreateForm.patchValue({
          priloha: reader.result.toString().split(',')[1]
        })};
      }
    }
  
  private loadPatientDetial() {
    this.pacientDetail = this.healthRecordVysetrenieService.getPacientDetail();
  }

  private listenToPractitionerIdFromStore() {
    this.subs.sink = this.store.select(getPractitionorIdState).subscribe((id: number) => {
      this.practitionerId = id;
    });

    this.practitionerTypes$ = this.store.select(getPractitionerAtestationsTypes);
  }

  private listenToChangeChorobaSearch() {
    this.chorobaZoznamBySearch$ = this.vysetrenieCreateForm.get('zapChoroba.chorobaSearch').valueChanges.pipe(
      debounceTime(1000),
      filter((searchParams: string) => searchParams.length > 3),
      distinctUntilChanged(),
      switchMap(searchParams => {
        return this.healthRecordService.searchChorobyByName$(searchParams);
      })  
    )
  }

  private initCreateForm() {
    this.vysetrenieCreateForm = this.fb.group({
      idPacient: [this.pacientDetail.idPacient, [Validators.required]],
      patientName: [{value: this.pacientDetail.fullName, disabled: true}, [Validators.required]],
      idTypVysetrenia: ['' , [Validators.required]],
      idLekar: [this.practitionerId, [Validators.required]],
      rodneCislo: [{value: this.pacientDetail.bid, disabled: true}],
      vysledok: ['', [Validators.required]],
      priloha: [null, [Validators.required]],
      zapChoroba: this.fb.group({
        idZdravotnaKarta: [this.pacientDetail.idPacient, [Validators.required]],
        cisChoroba: ['B300' , [Validators.required]],
        chorobaSearch: ['' , [Validators.required]],
        priznakies: this.fb.array([
          this.fb.group({
            cisChoroba: ['B300' , [Validators.required]],
            idZdravotnaKarta: [this.pacientDetail.idPacient, [Validators.required]],
            idSymptom: ['' , [Validators.required]],
          })
        ])
      }),
      predpisanaLiecba: this.fb.group({
        idLiek: ['', [Validators.required]],
        davkovaniePocet: ['', [Validators.required]]
      }),
      recept: this.fb.group({
        idLiek: ['', [Validators.required]],
        balenieKs: ['', [Validators.required]],
        idBalenie: ['', [Validators.required]]
      })
    });

    this.listenToChangeChorobaSearch();
  }
}
