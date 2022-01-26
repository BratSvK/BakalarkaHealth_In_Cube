import { Component, HostListener, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { SprievodkaFormModel } from 'src/app/models/Sprievodka/sprievodkaFormModel';
import { FormularService } from 'src/app/_service/formular.service';
import { SubSink } from 'subsink';

import { faInfoCircle } from '@fortawesome/free-solid-svg-icons';
import { BsDaterangepickerConfig } from 'ngx-bootstrap/datepicker';
import { BID_LENGHT } from 'src/app/models/pacientCard';
import { catchError, map, switchMap } from 'rxjs/operators';
import { PatientService } from 'src/app/_service/patient.service';
import { BehaviorSubject, EMPTY, of } from 'rxjs';
import { PatientSearch } from 'src/app/models/Sprievodka/pacientSearch';

@Component({
  selector: 'app-sprievodka-modal',
  templateUrl: './sprievodka-modal.component.html',
  styleUrls: ['./sprievodka-modal.component.css']
})
export class SprievodkaModalComponent implements OnInit, OnDestroy {
  sprievodkaHeaderText: string = 'Vytvoriť sprievodku';
  list: any[] = [];
  closeBtnName: string;
  sprievodkaForm: FormGroup;
  infoTooltip = faInfoCircle;
  notFound$ = new BehaviorSubject(false);

  infoVysetrenie = 'očný lekár, zaoberá sa výskumom, diagnózou, prevenciou a liečbou očných chorôb';

  private subs = new SubSink();

  bsConfig?: Partial<BsDaterangepickerConfig>;

  typeOfDoctors: {id: number, nazov: string}[] = [];
  private readonly defaultSprievodkaData: SprievodkaFormModel;

  constructor(
    public bsModalRef: BsModalRef, 
    fb: FormBuilder, 
    private formService: FormularService,
    private pacientService: PatientService
  ) {
    this.sprievodkaForm = fb.group({
      idPacient: ['', [Validators.required]],
      birthIDNumber: ['',[Validators.required, this.formService.matchLengthSize(BID_LENGHT)]],
      patientName: ['', [Validators.required]],
      idTypVysetrenia: ['' , [Validators.required]],
      idLekar: ['', [Validators.required]],
      lekarName: ['', [Validators.required]],
      dlzkaVysetrenia: ['', [Validators.required]],
      terminDatum: ['', [Validators.required]]
    });
  }
  ngOnDestroy(): void {
    this.subs.unsubscribe();
  }

  ngOnInit(): void {
    this.sprievodkaForm.patchValue({
      ...this.defaultSprievodkaData,
      idTypVysetrenia: this.typeOfDoctors[0]?.id
    });

    this.subcribeToPacientBID();
  } 

  createSprievodka() {
    this.sprievodkaForm.markAllAsTouched();
    if (this.sprievodkaForm.invalid) {
      this.formService.focusAtFirstErrorInForm(this.sprievodkaForm);
      return;
    }
  }

  private subcribeToPacientBID() {
    this.subs.sink = this.sprievodkaForm.controls.birthIDNumber.valueChanges.pipe(
      switchMap((bid: string) => {
        return bid.length === BID_LENGHT ? 
          this.pacientService.getPacientByBID(bid).pipe(
            map((patientSearch: PatientSearch) => {
              if (patientSearch.idPacient > -1)
              this.notFound$.next(false);
              this.sprievodkaForm.patchValue({idPacient: patientSearch.idPacient, patientName: patientSearch.name })
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

  @HostListener('document:keydown.escape')
  closeSprievodkaForm() {
    this.subs.unsubscribe();
    this.bsModalRef.hide();
  }
}
