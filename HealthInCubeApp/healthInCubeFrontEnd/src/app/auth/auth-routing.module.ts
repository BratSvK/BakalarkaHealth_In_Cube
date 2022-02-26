import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { PreventUnsavedChangesGuard } from "../_guards/prevent-unsaved-changes.guard";
import { AuthComponent } from "./auth.component";
import { RegisterLekarComponent } from "./register-lekar/register-lekar.component";
import { RegisterComponent } from "./register/register.component";
import { ForgotPasswordComponent } from "./forgot-password/forgot-password.component";
import { ResetPasswordComponent } from "./forgot-password/reset-password/reset-password.component";


const authRoutes: Routes = [
    { path: '', component: AuthComponent},
    { path: 'register-patient', component: RegisterComponent, canDeactivate: [PreventUnsavedChangesGuard]},
    { path: 'register-lekar',   component: RegisterLekarComponent, canDeactivate: [PreventUnsavedChangesGuard]},
    { path: 'zabudnute-heslo',   component: ForgotPasswordComponent},
    { path: 'reset-heslo',   component: ResetPasswordComponent}
];


@NgModule({
    imports: [RouterModule.forChild(authRoutes)],
    exports: [RouterModule]
})
export class AuthRoutingModule {}