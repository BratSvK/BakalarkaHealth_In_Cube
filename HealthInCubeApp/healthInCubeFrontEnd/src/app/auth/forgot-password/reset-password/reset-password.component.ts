import { Route } from '@angular/compiler/src/core';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { ResetPassword } from 'src/app/models/zabudnuteHeslo/resetPassword';
import { AuthService } from 'src/app/_service/auth.service';

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.css']
})
export class ResetPasswordComponent implements OnInit {
  resetPasswordForm: FormGroup;

  private _token: string;
  private _email: string;

  public get password1(): any{
    return this.resetPasswordForm.get('password1').value;
  }
  public get password2(): any{
    return this.resetPasswordForm.get('password2').value;
  }

  hide = true;

  constructor(
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private router: Router,
    private toastr: ToastrService,
    private authService: AuthService
  ) { }

  ngOnInit(): void {
    this.initForm();
    this._token = this.route.snapshot.queryParams['token'];
    this._email = this.route.snapshot.queryParams['email'];
  }

  public resetPassword(): void {
    const resetPasswordUser = this.createResetPasswordUserToApi();  

    this.authService.resetPasswordUser(resetPasswordUser).subscribe(result =>
      {
        this.router.navigate(['auth']);
        this.toastr.success('Heslo úspešné zmenené');
      },
      // tslint:disable-next-line: no-shadowed-variable
      (error) =>
      {
        this.toastr.error('Nastala chyba');
      });

  }

private initForm() {
  this.resetPasswordForm = this.fb.group({
    password1: ['', [
      Validators.required,
      Validators.pattern('^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]+)$'),
      Validators.minLength(8),
      Validators.min(8),
      Validators.max(20)
    ]],
    password2: ['', [
      Validators.required,
      Validators.pattern('^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]+)$'),
      Validators.minLength(8),
      Validators.min(8),
      Validators.max(20)
    ]]
  });

}
 

private createResetPasswordUserToApi(): ResetPassword {
  return {
    token: this._token,
    email: this._email,
    password: this.resetPasswordForm.get('password1').value,
    confirmPassword: this.resetPasswordForm.get('password2').value,
  }
}
}

