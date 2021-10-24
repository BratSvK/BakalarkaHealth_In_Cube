import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { PreventUnsavedChangesGuard } from "../_guards/prevent-unsaved-changes.guard";
import { AuthComponent } from "./auth.component";
import { RegisterComponent } from "./register/register.component";


const authRoutes: Routes = [
    { path: '', component: AuthComponent},
    { path: 'register', component: RegisterComponent, canDeactivate: [PreventUnsavedChangesGuard]}
];


@NgModule({
    imports: [RouterModule.forChild(authRoutes)],
    exports: [RouterModule]


})
export class AuthRoutingModule {}