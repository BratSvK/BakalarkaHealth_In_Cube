import { formatDate } from '@angular/common';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Store } from '@ngrx/store';
import * as moment from 'moment';
import { Observable, Subscription } from 'rxjs';
import { Mesto } from 'src/app/models/mesto';
import { Okres } from 'src/app/models/okres';
import { Lekar } from 'src/app/models/lekar';
import { AppState } from 'src/app/_store/models/AppState';

import * as RegisterBundleActions from './store/register.actions';
import { RegisterPouzivatel } from 'src/app/models/pouzivatelRegistracia';



@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit, OnDestroy {

  genders: string[] = ["M", "F"];
  okresy: Okres[] = [];
  mesta: Mesto[] = [];
  practitioners: Lekar[] = [];
  chooseLekar: Lekar;

  isShowenSelectionOfPractitioners = false;


  registerSub: Subscription;
  registerForm: FormGroup;

  constructor(private store: Store<AppState>, private router: Router, private route: ActivatedRoute) { 

    
  }
 

  ngOnInit(): void {

    this.registerSub = this.store.select('register').subscribe(registerFormData => {
      this.okresy = registerFormData.okresy;
      this.mesta = registerFormData.mesta;
      this.practitioners = registerFormData.practitioners;
      if (this.practitioners.length > 0) {
        this.registerForm.controls['practitioner'].enable();
      };
    });




    this.initForm();

  }

  practitionerChoosed(): boolean {
    let practiotioner = this.registerForm.get('practitioner').status;
    return practiotioner === "VALID";
  }

  onCountryChange() {
    let country: string = this.registerForm.get('userAddress.country').value;
      if (country && country.toLocaleLowerCase() === "slovakia") {
      this.store.dispatch(new RegisterBundleActions.FetchOkresy);
    }
  }
  

  onChangeOkres() {
    var idOkres: number = this.registerForm.get('userAddress.district').value;
    this.store.dispatch(new RegisterBundleActions.FetchMesta(idOkres));
  }



  onChangeCity() {
    var idCity = this.registerForm.get('userAddress.city').value as number;
    var vekPacienta = this.getAgeByDateBirth();
    console.log(this.isShowenSelectionOfPractitioners);
    if (this.isShowenSelectionOfPractitioners)
    {
    }
    this.store.dispatch(new RegisterBundleActions.FetchPractitioners({idMesto: idCity, vek: vekPacienta}));
  }



  onSubmit() {

    var registerPouzivatel = this.createModelToSingUp();
    
    this.store.dispatch(new RegisterBundleActions.RegisterUserStart(registerPouzivatel));
    
  }

  onReturn() {
    this.store.dispatch(new RegisterBundleActions.ResetForm());
    this.router.navigate(['../'], {relativeTo: this.route});
  }



  


  onCalculateFromBIDToBirthDate() {
  
    let BID: string = this.registerForm.get('userData.birthIDNumber')?.value;

    if ( BID != undefined || BID != null)
    {
      var pohlavie = this.chceckPohlavie(BID.substr(2,1)) ? 0 : 1;

      if (pohlavie === 1) {
        let BIDMesiac = BID.substr(2,1) === '5' ?  BID.substr(2,1).replace('5','0') : BID.substr(2,1).replace('6','1');
        BID = `${BID.substr(0,2)}${BIDMesiac}${BID.substr(3,1)}${BID.substr(4,7)}`;
      }

      let dateStr = `19${BID.substr(0,2)}-${BID.substr(2,2)}-${BID.substr(4,2)}}`;
      
      //905124/4168
      
      this.registerForm.get('userData.birthDate')?.setValue(this.getDateByBID(dateStr));
      this.registerForm.get('userData.gender')?.setValue(this.genders[pohlavie]);
    }
  }


  onChangePractitioner() {
    let lekar = this.registerForm.get('practitioner').value as Lekar;
    this.chooseLekar = lekar;
  }


  private getAgeByDateBirth() : number
  {
    var birthDate = this.registerForm.get('userData.birthDate').value;
    let dateToSet = moment(birthDate,"YYYY-MM-DD").toDate();

    
    if (birthDate === null) return -1;

    let timeDiff = Math.abs(Date.now() - dateToSet.getTime());
    let age = Math.floor((timeDiff / (1000 * 3600 * 24))/365.25);
    return age;
  } 

  private getDateByBID(dateString: string): string{
    let dateToSet = moment(dateString,"YYYY-MM-DD").toDate();
    let dateTest = new Date(dateToSet.getFullYear(), dateToSet.getMonth(), dateToSet.getDate() + 1 );
    return dateTest.toISOString().substr(0,10);
  }

  private chceckPohlavie(mesiac: string): boolean {
    return (mesiac === '1' || mesiac === '2');
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
        ]),
        birthDate: new FormControl(null, [Validators.required]),
        email: new FormControl('', [Validators.required, Validators.email]),
        phoneNumber: new FormControl(null),
        gender: new FormControl(null, [Validators.required]),
      }),
      userAddress: new FormGroup({
        country: new FormControl(null, [Validators.required]),
        district: new FormControl(null, Validators.required),
        city: new FormControl(null, Validators.required),
        street: new FormControl('', Validators.required),
        isPernamentAddress: new FormControl(null),
      }),
      practitioner: new FormControl({value: null, disabled: true}, Validators.required),
    });
  }

  private createModelToSingUp(): RegisterPouzivatel {
    return {
      meno: this.registerForm.get('userData.firstName').value,
      priezvisko: this.registerForm.get('userData.lastName').value,
      rodPriezvisko: this.registerForm.get('userData.familyName').value,
      rodCislo: this.registerForm.get('userData.birthIDNumber').value,
      datNarodenia: this.registerForm.get('userData.birthDate').value,
      email: this.registerForm.get('userData.email').value,
      mobil: this.registerForm.get('userData.phoneNumber').value,
      pohlavie: this.registerForm.get('userData.gender').value,
      country: this.registerForm.get('userAddress.country').value,
      district: this.registerForm.get('userAddress.district').value,
      city: this.registerForm.get('userAddress.city').value,
      street: this.registerForm.get('userAddress.street').value,
      isPernamentAddress: this.registerForm.get('userAddress.isPernamentAddress').value,
      password: this.registerForm.get('password').value,
      idDoctor: this.registerForm.get('practitioner').value.idLekar,
    };
  }


  


  ngOnDestroy(): void {
    if(this.registerSub) {
      this.registerSub.unsubscribe();
    }
  }

}
