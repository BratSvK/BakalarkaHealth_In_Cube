import { Component, EventEmitter, OnDestroy, OnInit, Output } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { 
  faCaretRight, 
  faPen, 
  faTrash, 
  faDiagnoses, 
  faProcedures,
  faTimes, 
  faFilePrescription} from '@fortawesome/free-solid-svg-icons';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { debounceTime, distinctUntilChanged, filter, switchMap, tap } from 'rxjs/operators';
import { LekarTypAtestacie } from 'src/app/models/lekar/atestacia/atestaciaLekarType';
import { PacientCard } from 'src/app/models/pacient/pacientCard';
import { Choroba, CHOROBA_UNSELECTED_VALUE, LIEK_UNSELECTED_VALUE } from 'src/app/models/pacient/zdravotnaKarta/zapChoroby/choroba';
import { Balenie } from 'src/app/models/pacient/zdravotnaKarta/zapChoroby/liek/balenie/balenie';
import { Liek } from 'src/app/models/pacient/zdravotnaKarta/zapChoroby/liek/liek';
import { Priznak, TypPriznak } from 'src/app/models/pacient/zdravotnaKarta/zapChoroby/priznakChoroba';
import { DEFAULT_CIS_CHOROBY_NOT_SELECTED } from 'src/app/shared/defaults';
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
  eraseIcon = faTimes;
  pacientDetail: PacientCard;
  practitionerId: number;
  practitionerTypes$: Observable<LekarTypAtestacie[]>;
  chorobaZoznamBySearch$: Observable<Choroba[]>;
  liekZoznamBySearch$: Observable<Liek[]>;
  zoznamLiekBalenia: Balenie[];
  chorobaTitle = "Zapísať chorobu";
  liecbaTitle = "Predpísať liečbu";
  receptTitle = "Predpísať recept";
  priznakyZoznam$: Observable<TypPriznak[]>;
  selectedChoroba: string = CHOROBA_UNSELECTED_VALUE;
  selectedLiek: string = LIEK_UNSELECTED_VALUE;
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

  get isSelectedChoroba() {
    return this.selectedChoroba !== CHOROBA_UNSELECTED_VALUE;
  }

  get priznakyArray() {
    return (<FormArray>this.vysetrenieCreateForm.get('zapChoroba.priznakies')).controls;
  }

  get idLiekRecept() {
    return this.vysetrenieCreateForm.get('recept.idLiek');
  }

  get idLiek() {
    return this.vysetrenieCreateForm.get('predpisanaLiecba.idLiek').value;
  }

  get liekSearch() {
    return this.vysetrenieCreateForm.get('predpisanaLiecba.liekSearch');
  }

  get cisChorobyFormValue() {
    return this.vysetrenieCreateForm.get('zapChoroba.cisChoroba').value;
  }


  getBaleniePopis(balenie: Balenie) {
    return `${balenie.kodBalenia}: ${balenie.pocetKs}-${balenie.cena}`
  }
  onSelected(choroba: Choroba) {
    this.selectedChoroba = choroba.nazov;
    this.vysetrenieCreateForm.get('zapChoroba.cisChoroba').setValue(choroba.cisChoroba);
    this.priznakyArray[0].patchValue({cisChoroba: this.cisChorobyFormValue});
  }

  onSelectedLiek(liek: Liek) {
    this.selectedLiek = liek.nazov;
    this.vysetrenieCreateForm.get('predpisanaLiecba.idLiek').setValue(liek.idLiek);
    this.idLiekRecept.setValue(this.idLiek);
  }

  onAddPriznak() {
    (<FormArray>this.vysetrenieCreateForm.get('zapChoroba.priznakies')).push(
      this.fb.group({
          cisChoroba: [this.cisChorobyFormValue , [Validators.required]],
          idZdravotnaKarta: [this.pacientDetail.idPacient, [Validators.required]],
          idSymptom: ['' , [Validators.required]],
        })
    );
  }

  onDeletePriznak(index: number) {
    (<FormArray>this.vysetrenieCreateForm.get('zapChoroba.priznakies')).removeAt(index);
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
  unselectChoroba() {
    this.selectedChoroba = CHOROBA_UNSELECTED_VALUE;
  }

  unselectLiek() {
    this.selectedLiek = LIEK_UNSELECTED_VALUE;
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

  private listenToTypPriznakyZoznam() {
    this.priznakyZoznam$ = this.healthRecordVysetrenieService.getAllChorobaPriznaky$();
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

   private listenToChangeLiekSearch() {
    this.liekZoznamBySearch$ = this.liekSearch.valueChanges.pipe(
      debounceTime(1000),
      filter((searchParams: string) => searchParams.length > 3),
      distinctUntilChanged(),
      switchMap(searchParams => {
        return this.healthRecordService.searchLiekyByName$(searchParams);
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
        cisChoroba: ['' , [Validators.required]],
        chorobaSearch: [''],
        priznakies: this.fb.array([
          this.fb.group({
            cisChoroba: [DEFAULT_CIS_CHOROBY_NOT_SELECTED , [Validators.required]],
            idZdravotnaKarta: [this.pacientDetail.idPacient, [Validators.required]],
            idSymptom: ['' , [Validators.required]],
          })
        ])
      }),
      predpisanaLiecba: this.fb.group({
        liekSearch: [''],
        idLiek: ['', [Validators.required]],
      }),
      recept: this.fb.group({
        idLiek: ['', [Validators.required]],
        balenieKs: ['', [Validators.required]],
        idBalenie: ['', [Validators.required]]
      })
    });

    this.listenToChangeChorobaSearch();
    this.listenToChangeLiekSearch();
    this.listenToTypPriznakyZoznam();
    this.listenToBaleniaZoznam();
  }

  private listenToBaleniaZoznam() {
    this.subs.sink = this.vysetrenieCreateForm.get('predpisanaLiecba.idLiek').valueChanges.pipe(
      switchMap((idLiek: number) => {
        return this.healthRecordVysetrenieService.getBaleniaToMedicament$(idLiek);
      })
    ).subscribe(items => {
      this.zoznamLiekBalenia = [...items];
    });
  }
}
