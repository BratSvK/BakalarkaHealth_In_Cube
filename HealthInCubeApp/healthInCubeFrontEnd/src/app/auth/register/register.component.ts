import { formatDate } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {


  genders: string[] = ["male", "female"];

  registerForm: FormGroup;

  constructor() { }

  ngOnInit(): void {
    this.initForm();
  }



  onSubmit() {
    this.calculateFromBIDToBirthDate();
  }



  private calculateFromBIDToBirthDate() {
    let BID: string = this.registerForm.get('birthIDNumber')?.value;

    const regex = new RegExp('/');
    if ( BID != undefined || BID != null)
    {
      // console.log(BID.replace(regex, ''));
      let date = `${BID.substr(4,2)}.${BID.substr(2,2)}.19${BID.substr(0,2)}`;
      let pohlavie: boolean;
      console.log(date);
      // this.registerForm.get('birthDate')?.setValue(formatDate(BID,'dd.mm.yyyy','en'));
    }
  }

  private initForm() {
    this.registerForm = new FormGroup({
      firstName: new FormControl("", Validators.required),
      lastName: new FormControl("", Validators.required),
      familyName: new FormControl(""),
      birthIDNumber: new FormControl(null),
      birthDate: new FormControl(null, [Validators.required]),
      email: new FormControl("", [Validators.required, Validators.email]),
      phoneNumber: new FormControl(null),
      gender: new FormControl(null, [Validators.required]),
      country: new FormControl(null, [Validators.required]),
      district: new FormControl(null, Validators.required),
      city: new FormControl(null, Validators.required),
      street: new FormControl("", Validators.required),
      isPernamentAddress: new FormControl(null),
    });
  }

}
