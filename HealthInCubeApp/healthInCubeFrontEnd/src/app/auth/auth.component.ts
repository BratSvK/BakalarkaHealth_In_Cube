import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Store } from '@ngrx/store';
import { PrihlaseniePouzivatel } from '../models/prihlaseniePouzivatel';
import { AppState } from '../_store/models/AppState';
import * as AuthentificateBundleActions from './store/auth.actions';

@Component({
  selector: 'app-auth',
  templateUrl: './auth.component.html',
  styleUrls: ['./auth.component.css']
})
export class AuthComponent implements OnInit {

  loginForm: FormGroup;

  constructor(private router: Router, private route: ActivatedRoute, private store: Store<AppState>) { }

  ngOnInit(): void {

    this.initForm();
  }




  onRegisterPage() {
    this.router.navigate(['register'], {relativeTo: this.route});
  }


  onSubmit() {
    var loginUser = this.createLoginUser();

    this.store.dispatch(new AuthentificateBundleActions.LoginStart(loginUser));
  }



  private createLoginUser(): PrihlaseniePouzivatel {
    return {
      email: this.loginForm.get('email').value,
      password: this.loginForm.get('password').value
    };
  }



  private initForm() {
    this.loginForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required])
    })
  }


}
