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

@NgModule({
    declarations: [
        AuthComponent,
        RegisterComponent,
        PractitionerInfoComponent,
        ModalRegisterComponent,
        RegisterLekarComponent
    ],
    imports: [
        ReactiveFormsModule,
        SharedModule,
        AuthRoutingModule,
        NgAnimatedBorderModule
    ]
    
})
export class AuthModule {}