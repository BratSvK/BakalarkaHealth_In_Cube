import { Component, HostListener, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { SprievodkaCreateModelApi, SprievodkaFormModel } from 'src/app/models/sprievodka/sprievodkaFormModel';
import { FormularService } from 'src/app/_service/formular.service';
import { SubSink } from 'subsink';

import { faInfoCircle } from '@fortawesome/free-solid-svg-icons';
import { BsDaterangepickerConfig } from 'ngx-bootstrap/datepicker';
import { BID_LENGHT } from 'src/app/models/pacientCard';
import { catchError, map, switchMap, tap } from 'rxjs/operators';
import { PatientService } from 'src/app/_service/patient.service';
import { BehaviorSubject, EMPTY, Observable, of } from 'rxjs';
import { PatientSearch } from 'src/app/models/sprievodka/pacientSearch';
import { LekarTyp } from 'src/app/models/lekar/typLekar';
import { LekarService } from 'src/app/_service/lekar.service';
import { LekarSprievodka } from 'src/app/models/lekar/lekarSprievodka';
import { SprievodkaService } from 'src/app/_service/sprievodka.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-sprievodka-modal',
  templateUrl: './sprievodka-modal.component.html',
  styleUrls: ['./sprievodka-modal.component.css']
})
export class SprievodkaModalComponent implements OnInit, OnDestroy {
  sprievodkaHeaderText: string = 'Vytvoriť sprievodku';
  closeBtnName: string;
  title: string;
  sprievodkaForm: FormGroup;
  infoTooltip = faInfoCircle;
  bsConfig?: Partial<BsDaterangepickerConfig>;
  typeOfDoctors$: Observable<LekarTyp[]>;
  doctorsBySelectedType: LekarSprievodka[];
  infoTypeDoctor: string  = 'Vyber si typ lekára';

  notFound$ = new BehaviorSubject(false);
  isAvailable$ = new BehaviorSubject(true);
  
  private readonly defaultSprievodkaData: SprievodkaFormModel;
  private subs = new SubSink();

  @HostListener('document:keydown.escape')
   closeSprievodkaForm() {
    this.subs.unsubscribe();
    this.bsModalRef.hide();
  }

  constructor(
    public bsModalRef: BsModalRef, 
    fb: FormBuilder, 
    private formService: FormularService,
    private pacientService: PatientService,
    private lekarService: LekarService,
    private sprievodkaService: SprievodkaService,
    private toastr: ToastrService
  ) {
    this.initSprievodkaForm(fb);
    this.listenToDoctorTypes();
  }

  ngOnDestroy(): void {
    this.subs.unsubscribe();
  }

  ngOnInit(): void {
    this.sprievodkaForm.patchValue({
      ...this.defaultSprievodkaData,
    });
    this.subcribeToPacientBID();
    this.subcribeToIsAvailableDate();
    this.subscribeToDisabledTermin();
  } 

  createSprievodka() {
    this.sprievodkaForm.markAllAsTouched();
    if (this.sprievodkaForm.invalid) {
      this.formService.focusAtFirstErrorInForm(this.sprievodkaForm);
      return;
    }
    let sprievodkaModelForm = this.buildSprievodkaModalForm();
   this.subs.sink = this.sprievodkaService.createSprievodka(sprievodkaModelForm).pipe(
    tap(() => {
      this.toastr.success("Sprievodka vytvorená a poslaná do kalendára.");
      this.closeSprievodkaForm();
    })
   ).subscribe();
  }

  selectTypeInfo(doctorTypes: LekarTyp[]) {
    let typeDoctor: LekarTyp = doctorTypes.find(type => type.idTyp === +this.sprievodkaForm.controls.idTypVysetrenia.value);
    this.infoTypeDoctor = typeDoctor.popis;
    this.subs.sink = this.lekarService.getDoctorsByType(typeDoctor.idTyp)
    .subscribe(lekari => {
      this.doctorsBySelectedType = lekari;
    });
  }


  private fixDate(d: Date): Date {
    var date = new Date(d.toDateString());
    var userTimezoneOffset = date.getTimezoneOffset() * 60000;
    return new Date(date.getTime() - userTimezoneOffset);
  }

  private buildSprievodkaModalForm(): SprievodkaCreateModelApi {
    let fixedDated = this.fixDate(this.sprievodkaForm.controls.terminDatum.value);
    this.sprievodkaForm.patchValue({terminDatum: fixedDated});
    return new SprievodkaCreateModelApi(this.sprievodkaForm.value);
  }

  private subscribeToDisabledTermin() {
    if (this.sprievodkaForm.controls.idLekar.value !== '' && this.sprievodkaForm.controls.idLekar.value !== undefined) {
      console.log('som nastavený')
    }
    this.subs.sink = this.sprievodkaForm.controls.idLekar.valueChanges
      .pipe(
        tap(a => this.sprievodkaForm.controls.terminDatum.enable({
          onlySelf: true, 
          emitEvent: false
        }))
      ).subscribe();
  }

  private listenToDoctorTypes() {
    this.typeOfDoctors$ = this.lekarService.getLekarTypes();
  }

  private initSprievodkaForm(fb: FormBuilder) {
    this.sprievodkaForm = fb.group({
      idPacient: ['', [Validators.required]],
      birthIDNumber: ['',[Validators.required, this.formService.matchLengthSize(BID_LENGHT)]],
      patientName: [{value: '', disabled: true}, [Validators.required]],
      idTypVysetrenia: ['' , [Validators.required]],
      idLekar: ['', [Validators.required]],
      terminDatum: [{value: '', disabled: true}, [Validators.required]]
    });
  }

  private subcribeToPacientBID() {
    this.subs.sink = this.sprievodkaForm.controls.birthIDNumber.valueChanges.pipe(
      switchMap((bid: string) => {
        return bid.length === BID_LENGHT ? 
          this.pacientService.getPacientByBID(bid).pipe(
            map((patientSearch: PatientSearch) => {
              if (patientSearch.idPacient > -1)
              this.notFound$.next(false);
              this.sprievodkaForm.patchValue({idPacient: patientSearch.idPacient, patientName: patientSearch.fullName })
            }),
            catchError((error) => {
              this.notFound$.next(true);
              return of(error);
            })
          )
          : of(EMPTY)
      })
    ).subscribe();
  }

  private subcribeToIsAvailableDate() {
    this.subs.sink = this.sprievodkaForm.controls.terminDatum.valueChanges.pipe(
      switchMap((termin: Date) => {
        let idLekar = +this.sprievodkaForm.controls.idLekar.value;
        return this.sprievodkaService.chechAvailabilityInDay(idLekar, termin.toISOString()).pipe(
            map((isAvailable: boolean) => {
             this.isAvailable$.next(isAvailable);
            }),
            catchError((error) => {
              this.isAvailable$.next(false);
              return of(error);
            })
          )
      })
    ).subscribe();
  }
}
