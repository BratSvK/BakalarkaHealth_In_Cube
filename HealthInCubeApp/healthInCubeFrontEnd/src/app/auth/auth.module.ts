import { NgModule } from "@angular/core";
import { ReactiveFormsModule } from "@angular/forms";
import { SharedModule } from "../shared/shared.module";
import { AuthRoutingModule } from "./auth-routing.module";
import { AuthComponent } from "./auth.component";
import { RegisterComponent } from './register/register.component';
import { NgAnimatedBorderModule } from 'ng-animated-border';

@NgModule({
    declarations: [
        AuthComponent,
        RegisterComponent
        
    ],
    imports: [
        ReactiveFormsModule,
        SharedModule,
        AuthRoutingModule,
        NgAnimatedBorderModule,
        
    ]
    
})
export class AuthModule {}