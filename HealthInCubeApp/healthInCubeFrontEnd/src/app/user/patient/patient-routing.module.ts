import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { UserDetailComponent } from "../user-detail/user-detail.component";
import { PatientComponent } from "./patient.component";



const patientRoutes: Routes = [
    { path: '', component: PatientComponent},
    { path: 'edit', component: UserDetailComponent}

];


@NgModule({
    imports: [RouterModule.forChild(patientRoutes)],
    exports: [RouterModule]


})
export class PatientRouting {}