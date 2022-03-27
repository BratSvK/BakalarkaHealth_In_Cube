import { ChangeDetectionStrategy, ChangeDetectorRef, Component, EventEmitter, OnDestroy, OnInit, Output } from '@angular/core';
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
import { ToastrService } from 'ngx-toastr';
import { Observable, of } from 'rxjs';
import { catchError, debounceTime, distinctUntilChanged, filter, switchMap, take, tap } from 'rxjs/operators';
import { LekarTypAtestacie } from 'src/app/models/lekar/atestacia/atestaciaLekarType';
import { PacientCard } from 'src/app/models/pacient/pacientCard';
import { VykVysetrenie } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/vykonaneVysetrenia';
import { VysetrenieVysledok } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/vysetrenieCreate';
import { Choroba, CHOROBA_UNSELECTED_VALUE, LIEK_UNSELECTED_VALUE } from 'src/app/models/pacient/zdravotnaKarta/zapChoroby/choroba';
import { Balenie } from 'src/app/models/pacient/zdravotnaKarta/zapChoroby/liek/balenie/balenie';
import { Liek } from 'src/app/models/pacient/zdravotnaKarta/zapChoroby/liek/liek';
import { TypPriznak } from 'src/app/models/pacient/zdravotnaKarta/zapChoroby/priznakChoroba';
import { DEFAULT_BALENIE_KS, DEFAULT_CIS_CHOROBY_NOT_SELECTED } from 'src/app/shared/defaults';
import { getPractitionerAtestationsTypes, getPractitionorIdState } from 'src/app/user/lekar/store/modelStore/LekarState';
import { HealthRecordVysetrenieService } from 'src/app/_service/health-record-vysetrenie.service';
import { HealthRecordService } from 'src/app/_service/health-record.service';
import { AppState } from 'src/app/_store/models/AppState';
import { SubSink } from 'subsink';

@Component({
  selector: 'app-health-record-vysetrenia-create',
  templateUrl: './health-record-vysetrenia-create.component.html',
  styleUrls: ['./health-record-vysetrenia-create.component.css'],
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class HealthRecordVysetreniaCreateComponent implements OnInit, OnDestroy {
  @Output() leaveCreateMode: EventEmitter<boolean> = new EventEmitter<boolean>();
  @Output() isCreateVysetrenie: EventEmitter<VykVysetrenie> = new EventEmitter<VykVysetrenie>();


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
  zoznamLiekBalenia$: Observable<Balenie[]>;
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
    private cdRef: ChangeDetectorRef,
    private healthRecordVysetrenieService: HealthRecordVysetrenieService,
    private healthRecordService: HealthRecordService,
    private store: Store<AppState>,
    private toaster: ToastrService
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

  get cisChorobyFormControl() {
    return this.vysetrenieCreateForm.get('zapChoroba.cisChoroba');
  }


  getBaleniePopis(balenie: Balenie) {
    return `Kód balenia:${balenie.kodBalenia}: ${balenie.pocetKs}ks - ${balenie.cena}€`
  }
  onSelected(choroba: Choroba) {
    this.selectedChoroba = choroba.nazov;
    this.vysetrenieCreateForm.get('zapChoroba.cisChoroba').patchValue(choroba.cisChoroba);
    this.priznakyArray[0].patchValue({cisChoroba: this.cisChorobyFormValue});
  }

  onSelectedLiek(liek: Liek) {
    const selectedLiek: Liek = {...liek};
    this.selectedLiek = selectedLiek.nazov;
    this.vysetrenieCreateForm.get('predpisanaLiecba.idLiek').setValue(selectedLiek.idLiek);
    this.idLiekRecept.setValue(selectedLiek.idLiek);
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
    this.vysetrenieCreateForm.reset();
  }

  createVystrenie() {
    const createVysetrenieModel = this.vysetrenieCreateForm.getRawValue() as VysetrenieVysledok;
    if (!!createVysetrenieModel)
     this.healthRecordVysetrenieService.createVysetrenie$(createVysetrenieModel)
     .pipe(
      take(1),
      catchError((error) => {
        this.toaster.error(error?.error);
        return of(undefined);
      })).subscribe((vykVystrenie: VykVysetrenie) => {
        if (vykVystrenie != undefined) {
          this.toaster.success('Vyšetrenie bolo zapísané do zdravotnej karty pacienta.')
          this.isCreateVysetrenie.emit(vykVystrenie);
          this.onLeaveCrateMode();
        }
      });
  }

  selectTypeInfo() {

  }
  unselectChoroba() {
    this.selectedChoroba = CHOROBA_UNSELECTED_VALUE;
    this.cisChorobyFormControl.setValue(-1);
  }

  unselectLiek() {
    this.selectedLiek = LIEK_UNSELECTED_VALUE;
    this.vysetrenieCreateForm.get('predpisanaLiecba.idLiek').patchValue(-1);
    this.idLiekRecept.patchValue(-1);
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
      idLekar: [this.practitionerId, [Validators.required]],
      idTypVysetrenia: ['' , [Validators.required]],
      vysledok: ['', [Validators.required]],
      priloha: [null],
      patientName: [{value: this.pacientDetail.fullName, disabled: true}],
      rodneCislo: [{value: this.pacientDetail.bid, disabled: true}],
      zapChoroba: this.fb.group({
        idZdravotnaKarta: [this.pacientDetail.idPacient, [Validators.required]],
        cisChoroba: [DEFAULT_CIS_CHOROBY_NOT_SELECTED , [Validators.required]],
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
        idBalenie: ['', [Validators.required]],
        balenieKs: [DEFAULT_BALENIE_KS, [Validators.required]]
      })
    });

    this.listenToChangeChorobaSearch();
    this.listenToChangeLiekSearch();
    this.listenToTypPriznakyZoznam();
    this.listenToBaleniaZoznam();
  }

  private listenToBaleniaZoznam() {
    this.zoznamLiekBalenia$ = this.vysetrenieCreateForm.get('recept.idLiek').valueChanges
    .pipe(
      switchMap((idLiek: number) => {
        return this.healthRecordVysetrenieService.getBaleniaToMedicament$(idLiek);
      }));
  }
}
