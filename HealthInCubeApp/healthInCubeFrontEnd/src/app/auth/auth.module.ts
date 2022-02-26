import { NgModule } from "@angular/core";
import { ReactiveFormsModule } from "@angular/forms";
import { SharedModule } from "../shared/shared.module";
import { AuthRoutingModule } from "./auth-routing.module";
import { AuthComponent } from "./auth.component";
import { RegisterComponent } from './register/register.component';
import { NgAnimatedBorderModule } from 'ng-animated-border';
import { PractitionerInfoComponent } from './register/practitioner-info/practitioner-info.component';
import { ModalRegisterComponent } from './modal-register/modal-register.component';
import { RegisterLekarComponent } from './register-lekar/register-lekar.component';
import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';
import { MatFormFieldModule } from "@angular/material/form-field";
import { MatInputModule } from "@angular/material/input";
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { ResetPasswordComponent } from './forgot-password/reset-password/reset-password.component';


@NgModule({
    declarations: [
        AuthComponent,
        RegisterComponent,
        PractitionerInfoComponent,
        ModalRegisterComponent,
        RegisterLekarComponent,
        ForgotPasswordComponent,
        ResetPasswordComponent
    ],
    imports: [
        ReactiveFormsModule,
        SharedModule,
        AuthRoutingModule,
        NgAnimatedBorderModule,
        MatFormFieldModule,
        MatInputModule,
        MatIconModule,
        MatButtonModule,
        MatCardModule
    ]
    
})
export class AuthModule {}