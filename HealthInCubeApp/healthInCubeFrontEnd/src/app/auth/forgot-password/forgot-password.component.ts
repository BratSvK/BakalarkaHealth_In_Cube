import { ThrowStmt } from '@angular/compiler';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Token } from 'src/app/models/token';
import { ForgotPassword } from 'src/app/models/zabudnuteHeslo/forgotPassword';
import { AuthService } from 'src/app/_service/auth.service';
import { SubSink } from 'subsink';

@Component({
  selector: 'app-reset-password',
  templateUrl: './forgot-password.component.html',
  styleUrls: ['./forgot-password.component.css']
})
export class ForgotPasswordComponent implements OnInit, OnDestroy {
  token: string;
  tokenFromDb: any;
  resetingUser: ForgotPassword;
  myForm: FormGroup;
  returnedToken: Token;

  private subSink = new SubSink();

  hide = true;

  public get emailValue(): any {
    return this.myForm.get('emailValue').value;
  }


  public set emailValue(value: string){
    this.myForm.get('emailValue').setValue(value);
  }

  constructor(
    private router: Router,
    private fb: FormBuilder,
    private authService: AuthService,
    private toaster: ToastrService
  ) { }

  ngOnDestroy(): void {
    this.subSink.unsubscribe();
  }

  ngOnInit(): void {
    this.initForm();
  }


  public resetPassword(): void {
    this.resetingUser = {
      email: this.emailValue,
      clientURI: ''
    };
    this.subSink.sink = this.authService.forgotPasswordUser(this.resetingUser).pipe(
      catchError((error) => {
        this.toaster.error("Nastala chyba" + error?.error);
        return of(error?.error);
      })).subscribe(result => {
        this.toaster.success('Link bol poslaný, prosím skontrolujte si email a zmenťe si heslo.');
        this.router.navigate(['auth']);
    });
  }

  private initForm() {
    this.myForm = this.fb.group({
      emailValue: ['', 
      [
        Validators.required,
        Validators.pattern(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)
      ]]
    });
  }

}
