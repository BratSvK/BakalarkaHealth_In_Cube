import { Component, OnDestroy, OnInit, ViewEncapsulation } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Store } from '@ngrx/store';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { SubSink } from 'subsink';
import { PrihlaseniePouzivatel } from '../models/prihlaseniePouzivatel';
import { AppState } from '../_store/models/AppState';
import { ModalRegisterComponent } from './modal-register/modal-register.component';
import * as AuthentificateBundleActions from './store/auth.actions';

@Component({
  selector: 'app-auth',
  templateUrl: './auth.component.html',
  styleUrls: ['./auth.component.css']
})
export class AuthComponent implements OnInit, OnDestroy {
  loginForm: FormGroup;
  bsModalRef: BsModalRef;

  private subs = new SubSink();

  constructor(
    private modalService: BsModalService,
    private router: Router, 
    private route: ActivatedRoute, 
    private store: Store<AppState>
  ) { }

  ngOnDestroy(): void {
    this.subs.unsubscribe();
  }

  ngOnInit(): void {
    this.initForm();
  }

  onRegisterPagePatient() {
    this.router.navigate(['register-patient'], {relativeTo: this.route});
  }

  onRegisterPageLekar() {
    this.router.navigate(['register-lekar'], {relativeTo: this.route});
  }

  onSubmit() {
    var loginUser = this.createLoginUser();
    this.store.dispatch(new AuthentificateBundleActions.LoginStart(loginUser));
  }


  openChooseRegisterTypeAccount() {
    const config = {
      class: 'modal-dialog-centered',
      initialState: {
        title: 'Vyber si typ registrácie',
        closeBtbName: 'Close',
      }
    };
    this.bsModalRef = this.modalService.show(ModalRegisterComponent, config);

    this.subs.sink = this.bsModalRef.content?.openRegisterPageLekar.subscribe(
      (isGoingToLekarRegisterPage: boolean) => {
        if (isGoingToLekarRegisterPage) {
          this.onRegisterPageLekar();
        } else {
          this.onRegisterPagePatient();
        }
      }
    )
    
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
