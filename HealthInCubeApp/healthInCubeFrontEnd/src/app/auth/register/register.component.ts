import { formatDate } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import * as moment from 'moment';

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
    // this.calculateFromBIDToBirthDate();
  }



  onCalculateFromBIDToBirthDate() {
  
    let BID: string = this.registerForm.get('birthIDNumber')?.value;

    const regex = new RegExp('/');
    if ( BID != undefined || BID != null)
    {
      // console.log(BID.replace(regex, ''));
      var pohlavie = this.chceckPohlavie(BID.substr(2,1)) ? 0 : 1;

      if (pohlavie === 1) {
        let BIDMesiac = BID.substr(2,1) === '5' ?  BID.substr(2,1).replace('5','0') : BID.substr(2,1).replace('6','1');
        BID = `${BID.substr(0,2)}${BIDMesiac}${BID.substr(3,1)}${BID.substr(4,7)}`;
      }

      let dateStr = `19${BID.substr(0,2)}-${BID.substr(2,2)}-${BID.substr(4,2)}}`;
      
      let dateToSet = moment(dateStr,"YYYY-MM-DD").toDate();
      let dateTest = new Date(dateToSet.getFullYear(), dateToSet.getMonth(), dateToSet.getDate() + 1 );
      let dateToReturn = dateTest.toISOString().substr(0,10);
      console.log(dateToReturn);
      //985124/4168
      
      this.registerForm.get('birthDate')?.setValue(dateToReturn);
      this.registerForm.get('gender')?.setValue(this.genders[pohlavie]);
    }
  }

  private chceckPohlavie(mesiac: string): boolean {
    return (mesiac === '1' || mesiac === '2');
  }

  private initForm() {
    this.registerForm = new FormGroup({
      firstName: new FormControl("", Validators.required),
      lastName: new FormControl("", Validators.required),
      familyName: new FormControl(""),
      birthIDNumber: new FormControl(null, [Validators.pattern("^[0-9]+[/]*[0-9]*$"),Validators.minLength(11)]),
      birthDate: new FormControl(new Date(), [Validators.required]),
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
