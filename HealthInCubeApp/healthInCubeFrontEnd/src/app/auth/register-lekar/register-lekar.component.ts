import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { faBaby } from '@fortawesome/free-solid-svg-icons';
import { Store } from '@ngrx/store';
import * as moment from 'moment';
import { Observable } from 'rxjs';
import { Adresa } from 'src/app/models/adresa';
import { LekarRegister } from 'src/app/models/lekar/lekarRegister';
import { LekarTyp } from 'src/app/models/lekar/typLekar';
import { Mesto } from 'src/app/models/mesto';
import { Nemocnica } from 'src/app/models/nemocnica/nemocnica';
import { Oddelenie } from 'src/app/models/nemocnica/oddelenie/oddelenie';
import { Okres } from 'src/app/models/okres';
import { RegisterPouzivatel } from 'src/app/models/pouzivatelRegistracia';
import { matchValues } from 'src/app/shared/auth-common';
import { LekarService } from 'src/app/_service/lekar.service';
import { AppState } from 'src/app/_store/models/AppState';
import * as RegisterBundleActions from './../register/store/register.actions';


@Component({
  selector: 'app-register-lekar',
  templateUrl: './register-lekar.component.html',
  styleUrls: ['./register-lekar.component.css']
})
export class RegisterLekarComponent implements OnInit {

  registerForm: FormGroup;
  babyIcon = faBaby;
  isSubmitted = false;


  genders: string[] = ['M', 'F'];
  okresy: Okres[] = [];
  mesta: Mesto[] = [];

  okresyBirth: Okres[] = [];
  mestaBirth: Mesto[] = [];


  nemocnice: Nemocnica[] = [];
  oddelenia: Oddelenie[] = [];

  typeOfDoctors$: Observable<LekarTyp[]>;



  constructor(
    private store: Store<AppState>,
    private router: Router,
    private route: ActivatedRoute,
    private lekarService: LekarService
  ) {}

  ngOnInit(): void {
    this.initForm();
    this.listenToDoctorTypes();
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

  onChangeCity() {
    var idCity = this.registerForm.get('userAddress.city').value as number;
    var vekPacienta = this.getAgeByDateBirth();

    if (vekPacienta !== -1)
      this.store.dispatch(
        new RegisterBundleActions.FetchPractitioners({
          idMesto: idCity,
          vek: vekPacienta,
        })
      );
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
    return mesiac === '1' || mesiac === '2';
  }

  onChangeBirthOkres() {
    var idOkres: number = this.registerForm.get(
      'birthPlace.districtBirth'
    ).value;
    this.store.dispatch(new RegisterBundleActions.FetchMestaBirth(idOkres));
  }

  private getAgeByDateBirth(): number {
    var birthDate = this.registerForm.get('userData.birthDate').value;
    let dateToSet = moment(birthDate, 'YYYY-MM-DD').toDate();

    if (birthDate === null) return -1;

    let timeDiff = Math.abs(Date.now() - dateToSet.getTime());
    let age = Math.floor(timeDiff / (1000 * 3600 * 24) / 365.25);
    return age;
  }

  private listenToDoctorTypes() {
    this.typeOfDoctors$ = this.lekarService.getLekarTypes();
  }

  onSubmit() {
    var registerPouzivatel = this.createModelToSingUp();
    this.isSubmitted = true;
    this.store.dispatch(
      new RegisterBundleActions.RegisterUserStart(registerPouzivatel)
    );
  }


  private initForm() {
    this.registerForm = new FormGroup({
      userData: new FormGroup({
        firstName: new FormControl('', Validators.required),
        lastName: new FormControl('', Validators.required),
        familyName: new FormControl(''),
        birthIDNumber: new FormControl(null, [
          Validators.pattern('^[0-9]+[/]*[0-9]*$'),
          Validators.minLength(11),
          Validators.maxLength(11),
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
        dlzkaVysetrenia: new FormControl(30, [Validators.required, Validators.min(1), Validators.max(120)]),
        idTypDoctor: new FormControl(null, [Validators.required]) 
      }
      )
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
      idDoctor: this.registerForm.get('practitioner').value.idLekar,
      adresa: adresa,
      idMestoNarodenia: +this.registerForm.get('birthPlace.cityBirth').value,
      idOddel: 1,
      dlzkaVysetrenia: this.registerForm.get('lekarData').value.dlzkaVysetrenia,
      pracovnaDobas: []
    };
  }
}
