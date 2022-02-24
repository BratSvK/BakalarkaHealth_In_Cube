import { Component, OnDestroy, OnInit, QueryList, ViewChildren } from '@angular/core';
import { FormArray, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { faBaby } from '@fortawesome/free-solid-svg-icons';
import { Store } from '@ngrx/store';
import { Observable, Subscription } from 'rxjs';
import { Adresa } from 'src/app/models/adresa';
import { AtestaciaLekar } from 'src/app/models/lekar/atestacia/atestaciaLekar';
import { LekarRegister } from 'src/app/models/lekar/lekarRegister';
import { ZoznamDenModel } from 'src/app/models/lekar/pracovnaDoba/pracDoba-zoznamDen';
import { LekarTyp } from 'src/app/models/lekar/typLekar';
import { Mesto } from 'src/app/models/mesto';
import { Nemocnica } from 'src/app/models/nemocnica/nemocnica';
import { Oddelenie } from 'src/app/models/nemocnica/oddelenie/oddelenie';
import { Okres } from 'src/app/models/okres';
import { matchValues } from 'src/app/shared/auth-common';
import { LekarService } from 'src/app/_service/lekar.service';
import { AppState } from 'src/app/_store/models/AppState';
import { PracovnaDobaService } from 'src/app/_service/pracovnaDoba.service';
import { TimepickerComponent, TimepickerConfig } from 'ngx-bootstrap/timepicker';
import { DEFAULT_TIME_END_WORK, DEFAULT_TIME_PER_PATIENT, DEFAULT_TIME_START_LUNCH, DEFAULT_TIME_START_WORK } from 'src/app/shared/defaults';
import { SubSink } from 'subsink';
import { NemocnicaService } from 'src/app/_service/nemocnica.service';
import { distinctUntilChanged, filter } from 'rxjs/operators';
import { getTimepickerConfig } from 'src/app/shared/common';


import * as RegisterBundleActions from './../register/store/register.actions';
import * as moment from 'moment';
import { PracovnaDoba } from 'src/app/models/pracovnaDoba/pracovnaDoba';

@Component({
  selector: 'app-register-lekar',
  templateUrl: './register-lekar.component.html',
  styleUrls: ['./register-lekar.component.css'],
  providers: [{ provide: TimepickerConfig, useFactory: getTimepickerConfig }]
})
export class RegisterLekarComponent implements OnInit, OnDestroy {

  @ViewChildren('timepicker') timepickerList: QueryList<TimepickerComponent>;

  registerForm: FormGroup;
  babyIcon = faBaby;
  isSubmitted = false;
  genders: string[] = ['M', 'F'];
  okresy: Okres[] = [];
  mesta: Mesto[] = [];
  okresyBirth: Okres[] = [];
  mestaBirth: Mesto[] = [];
  registerSub: Subscription;
  nemocnice: Nemocnica[] = [];
  oddelenia: Oddelenie[] = [];
  typeOfDoctors$: Observable<LekarTyp[]>;
  pracovnaDobaZoznamDni$: Observable<ZoznamDenModel[]>;

  private subs = new SubSink();


  get atestacieLekar() {
    return (<FormArray>this.registerForm.get('lekarData.atestacieLekar')).controls;
  }

  get pracovnaDoba() {
    return (<FormArray>this.registerForm.get('lekarData.pracovnaDobaZoznam')).controls;
  }

  get rodneCislo() {
    return (<FormControl>this.registerForm.get('userData.birthIDNumber'));
  }

  get pracovnaDobaValues(): PracovnaDoba[] {
    return (<FormControl>this.registerForm.get('lekarData.pracovnaDobaZoznam')).value;
  }

   get atestacieLekarValues(): AtestaciaLekar[] {
    return (<FormControl>this.registerForm.get('lekarData.atestacieLekar')).value;
  }

  constructor(
    private store: Store<AppState>,
    private router: Router,
    private route: ActivatedRoute,
    private lekarService: LekarService,
    private pracovnaDobaService: PracovnaDobaService,
    private nemocnicaService: NemocnicaService
  ) {}

  ngOnDestroy(): void {
    this.subs.unsubscribe();
  }

  ngOnInit(): void {
    this.initForm();
  }
  
  onReturn() {
    this.router.navigate(['../'], { relativeTo: this.route });
  }

  onCountryChange() {
    let country: string = this.registerForm.get('userAddress.country').value;
    if (country && country.toLocaleLowerCase() === 'slovensko') {
      this.store.dispatch(new RegisterBundleActions.FetchOkresy());
    }
  }

  onChangeOkres() {
    var idOkres: number = this.registerForm.get('userAddress.district').value;
    this.store.dispatch(new RegisterBundleActions.FetchMesta(idOkres));
  }

  onCountryBirthChange() {
    let country: string = this.registerForm.get(
      'birthPlace.countryBirth'
    ).value;
    if (country && country.toLocaleLowerCase() === 'slovensko') {
      this.store.dispatch(new RegisterBundleActions.FetchOkresyBirth());
    }
  }

  onCalculateFromBIDToBirthDate() {
    let BID: string = this.registerForm.get('userData.birthIDNumber')?.value;

    if (BID != undefined || BID != null) {
      var pohlavie = this.chceckPohlavie(BID.substr(2, 1)) ? 0 : 1;

      if (pohlavie === 1) {
        let BIDMesiac =
          BID.substr(2, 1) === '5'
            ? BID.substr(2, 1).replace('5', '0')
            : BID.substr(2, 1).replace('6', '1');
        BID = `${BID.substr(0, 2)}${BIDMesiac}${BID.substr(3, 1)}${BID.substr(
          4,
          7
        )}`;
      }

      let dateStr = `19${BID.substr(0, 2)}-${BID.substr(2, 2)}-${BID.substr(
        4,
        2
      )}}`;

      this.registerForm
        .get('userData.birthDate')
        ?.setValue(this.getDateByBID(dateStr));
      this.registerForm
        .get('userData.gender')
        ?.setValue(this.genders[pohlavie]);
    }
  }

  onChangeNemocnica() {
    this.oddelenia = this.nemocnice[this.registerForm.get('lekarData.idNemocnica').value - 1].oddelenies;
  }

  onChangeBirthOkres() {
    var idOkres: number = this.registerForm.get(
      'birthPlace.districtBirth'
    ).value;
    this.store.dispatch(new RegisterBundleActions.FetchMestaBirth(idOkres));
  }

  onSubmit() {
    var registerPouzivatelToDoctor = this.createModelToSingUp();
    this.isSubmitted = true;
    this.store.dispatch(
      new RegisterBundleActions.RegisterStartLekar(registerPouzivatelToDoctor)
    );
  }

  onSelectAtestaciaType(index: number) {
    const idTyp = (this.atestacieLekar[index].value as AtestaciaLekar).idTyp;
    this.atestacieLekar[index].get('idTypSelected').setValue(idTyp);
}

onAddAtestacia() {
  (<FormArray>this.registerForm.get('lekarData.atestacieLekar')).push(
    new FormGroup({
      idTyp: new FormControl('', [Validators.required]),
      idTypSelected:  new FormControl({value: '', disabled: true}, [Validators.required]),
    })
  )
}

onDeleteAtestacia(index: number) {
  (<FormArray>this.registerForm.get('lekarData.atestacieLekar')).removeAt(index);
}

onDeletePracovnaDoba(index: number) {
  (<FormArray>this.registerForm.get('lekarData.pracovnaDobaZoznam')).removeAt(index);
}


onAddPracovnaDoba() {
  (<FormArray>this.registerForm.get('lekarData.pracovnaDobaZoznam')).push(
    new FormGroup({
      idDen: new FormControl('', [Validators.required]),
      pracDobaOd: new FormControl(DEFAULT_TIME_START_WORK, [Validators.required]),
      pracDobaDo: new FormControl(DEFAULT_TIME_END_WORK, [Validators.required]),
      obedOd: new FormControl(DEFAULT_TIME_START_LUNCH, [Validators.required])
    })
  )
}

private listenToChangeDurationOfPatient() {
  this.subs.sink = this.registerForm.get('lekarData.dlzkaVysetrenia').valueChanges
  .subscribe(duration => this.timepickerList.forEach((item) => {
    item.minuteStep = duration;
  }));
}

  private getDateByBID(dateString: string): string {
    let dateToSet = moment(dateString, 'YYYY-MM-DD').toDate();
    let dateTest = new Date(
      dateToSet.getFullYear(),
      dateToSet.getMonth(),
      dateToSet.getDate() + 1
    );
    return dateTest.toISOString().substr(0, 10);
  }

  private chceckPohlavie(mesiac: string): boolean {
    return mesiac === '0' || mesiac === '1';
  }

  private listenToChangesPlace() {
    this.registerSub = this.store
      .select('register')
      .subscribe((registerFormData) => {
        this.okresy = registerFormData.okresy;
        this.mesta = registerFormData.mesta;
        this.okresyBirth = registerFormData.okresyBirth;
        this.mestaBirth = registerFormData.mestaBirth;
      });
  }

  private listenToDoctorTypes() {
    this.typeOfDoctors$ = this.lekarService.getLekarTypes();
  }

  private listenToZoznamDen() {
    this.pracovnaDobaZoznamDni$ = this.pracovnaDobaService.getPracovnaDobaDniZoznam$();
  }

  private initForm() {
    this.registerForm = new FormGroup({
      userData: new FormGroup({
        firstName: new FormControl('', Validators.required),
        lastName: new FormControl('', Validators.required),
        familyName: new FormControl(''),
        birthIDNumber: new FormControl('', [
          Validators.pattern('^[0-9]+[/]+[0-9]*$'),
          Validators.minLength(11),
          Validators.maxLength(11)
        ]),
        birthDate: new FormControl(null, [Validators.required]),
        email: new FormControl('', [Validators.required, Validators.email]),
        phoneNumber: new FormControl(null, [Validators.maxLength(12)]),
        gender: new FormControl(null, [Validators.required]),
        password: new FormControl('', [
          Validators.required,
          Validators.maxLength(10),
          Validators.minLength(4),
        ]),
        confirmPassword: new FormControl('', [
          Validators.required,
          matchValues('password'),
        ]),
      }),
      userAddress: new FormGroup({
        country: new FormControl(null, [Validators.required]),
        district: new FormControl(null, Validators.required),
        city: new FormControl(null, Validators.required),
        street: new FormControl('', Validators.required),
        isPernamentAddress: new FormControl(null),
      }),
      birthPlace: new FormGroup({
        countryBirth: new FormControl(null, [Validators.required]),
        districtBirth: new FormControl(null, Validators.required),
        cityBirth: new FormControl(null, Validators.required),
      }),
      lekarData: new FormGroup({
        idNemocnica: new FormControl(null, [Validators.required]),
        idOddelenie: new FormControl(null, [Validators.required]),
        dlzkaVysetrenia: new FormControl(DEFAULT_TIME_PER_PATIENT, [Validators.required, Validators.min(1), Validators.max(120)]),
        atestacieLekar: new FormArray([
           new FormGroup({
            idTyp: new FormControl('', [Validators.required]),
            idTypSelected: new FormControl({value: '', disabled: true}, [Validators.required]),
          })
        ]),
        pracovnaDobaZoznam: new FormArray([
          new FormGroup({
           idDen: new FormControl('', [Validators.required]),
           pracDobaOd: new FormControl(DEFAULT_TIME_START_WORK, [Validators.required]),
           pracDobaDo: new FormControl(DEFAULT_TIME_END_WORK, [Validators.required]),
           obedOd: new FormControl(DEFAULT_TIME_START_LUNCH, [Validators.required])
         })
       ])  
      }
      )
    });

    this.listenToChangesPlace();
    this.listenToDoctorTypes();
    this.listenToZoznamDen();
    this.listenToChangeDurationOfPatient();
    this.loadNemocnice();
    this.listenToBirthDNumberChange();
    }
  

  

  private listenToBirthDNumberChange() {
    this.subs.sink = this.registerForm.get('userData.birthIDNumber').valueChanges.pipe(
      filter((item: string) => this.rodneCislo.valid && item.length > 0),
      distinctUntilChanged()
    ).subscribe(() => {
      this.onCalculateFromBIDToBirthDate();
    });
  }

  private loadNemocnice() {
    this.subs.sink = this.nemocnicaService.getNemocnice$().subscribe(nemocniceZoznam => {
      this.nemocnice = nemocniceZoznam;
    });
  }

  private createModelToSingUp(): LekarRegister {
    var adresa: Adresa = {
      idMesto:  +this.registerForm.get('userAddress.city').value,
      trvale: this.registerForm.get('userAddress.isPernamentAddress').value,
      ulica: this.registerForm.get('userAddress.street').value,
    };

    return {
      meno: this.registerForm.get('userData.firstName').value,
      priezvisko: this.registerForm.get('userData.lastName').value,
      rodPriezvisko: this.registerForm.get('userData.familyName').value,
      rodCislo: this.registerForm.get('userData.birthIDNumber').value,
      datNarodenia: this.registerForm.get('userData.birthDate').value,
      email: this.registerForm.get('userData.email').value,
      mobil: this.registerForm.get('userData.phoneNumber').value,
      pohlavie: this.registerForm.get('userData.gender').value,
      password: this.registerForm.get('userData.password').value,
      idDoctor: -1,
      adresa: adresa,
      idMestoNarodenia: +this.registerForm.get('birthPlace.cityBirth').value,
      idNemocnica: this.registerForm.get('lekarData.idNemocnica').value,
      idOddelenie: this.registerForm.get('lekarData.idOddelenie').value,
      dlzkaVysetrenia: this.registerForm.get('lekarData.dlzkaVysetrenia').value,
      pracovnaDobas: this.pracovnaDobaValues,
      atestacieLekars: this.atestacieLekarValues
    };
  }
}
