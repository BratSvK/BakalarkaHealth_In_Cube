import {
  Component,
  ElementRef,
  OnDestroy,
  OnInit,
  ViewChild,
} from '@angular/core';
import {
  AbstractControl,
  FormControl,
  FormGroup,
  ValidatorFn,
  Validators,
} from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Store } from '@ngrx/store';
import * as moment from 'moment';
import { Subscription } from 'rxjs';
import { Mesto } from 'src/app/models/mesto';
import { Okres } from 'src/app/models/okres';
import { Lekar } from 'src/app/models/lekar/lekar';
import { AppState } from 'src/app/_store/models/AppState';

import * as RegisterBundleActions from './store/register.actions';
import { RegisterPouzivatel } from 'src/app/models/pouzivatelRegistracia';
import { Adresa } from 'src/app/models/adresa';

import { faBaby } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css'],
})
export class RegisterComponent implements OnInit, OnDestroy {
  @ViewChild('autofocus', { static: true }) menoInput: ElementRef;

  babyIcon = faBaby;

  genders: string[] = ['M', 'F'];
  okresy: Okres[] = [];
  mesta: Mesto[] = [];

  okresyBirth: Okres[] = [];
  mestaBirth: Mesto[] = [];
  practitioners: Lekar[] = [];
  chooseLekar: Lekar;

  isShowenSelectionOfPractitioners = false;

  registerSub: Subscription;
  registerForm: FormGroup;

  isSubmitted = false;

  constructor(
    private store: Store<AppState>,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.registerSub = this.store
      .select('register')
      .subscribe((registerFormData) => {
        this.okresy = registerFormData.okresy;
        this.mesta = registerFormData.mesta;
        this.practitioners = registerFormData.practitioners;
        this.okresyBirth = registerFormData.okresyBirth;
        this.mestaBirth = registerFormData.mestaBirth;
        if (this.practitioners.length > 0) {
          this.registerForm.controls['practitioner'].enable();
        }
      });

    this.initForm();
  }

  practitionerChoosed(): boolean {
    let practiotioner = this.registerForm.get('practitioner').status;
    return practiotioner === 'VALID';
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

  onSubmit() {
    var registerPouzivatel = this.createModelToSingUp();
    this.isSubmitted = true;
    this.store.dispatch(
      new RegisterBundleActions.RegisterUserStart(registerPouzivatel)
    );
  }

  onReturn() {
    this.store.dispatch(new RegisterBundleActions.ResetForm());
    this.router.navigate(['../'], { relativeTo: this.route });
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

  onChangePractitioner() {
    let lekar = this.registerForm.get('practitioner').value as Lekar;
    this.chooseLekar = lekar;
  }

  onCountryBirthChange() {
    let country: string = this.registerForm.get(
      'birthPlace.countryBirth'
    ).value;
    if (country && country.toLocaleLowerCase() === 'slovensko') {
      this.store.dispatch(new RegisterBundleActions.FetchOkresyBirth());
    }
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
          this.matchValues('password'),
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
      practitioner: new FormControl(
        { value: null, disabled: true },
        Validators.required
      ),
    });

    // aktualizovanie confirm password
    this.registerForm.get('userData.password').valueChanges.subscribe(() => {
      this.registerForm
        .get('userData.confirmPassword')
        .updateValueAndValidity();
    });

    this.focusNameInput();
  }

  private focusNameInput() {
    this.menoInput?.nativeElement.focus();
    window.scrollTo(0, 0);
  }

  private matchValues(matchTo: string): ValidatorFn {
    return (control: AbstractControl) => {
      return control?.value === control?.parent?.controls[matchTo].value
        ? null
        : { isMatching: true }; // return null ak prejde validacia
    };
  }

  private createModelToSingUp(): RegisterPouzivatel {
   
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
    };
  }

  ngOnDestroy(): void {
    if (this.registerSub) {
      this.registerSub.unsubscribe();
    }
  }
}
