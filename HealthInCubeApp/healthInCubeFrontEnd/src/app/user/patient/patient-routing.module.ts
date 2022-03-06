import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { CalendarComponent } from "../calendar/calendar.component";
import { UserDetailResolver } from "../user-detail/user-detail-resolver.service";
import { UserDetailComponent } from "../user-detail/user-detail.component";
import { HealthRecordResolver } from "./health-record-shell/health-record-resolver.service";
import { HealthRecordShellComponent } from "./health-record-shell/health-record-shell.component";
import { PatientComponent } from "./patient.component";

const patientRoutes: Routes = [
  {
    path: '',
    component: PatientComponent,
    children: [
      { path: '', pathMatch: 'full', redirectTo: 'calendar' },
      { path: 'edit', resolve: [UserDetailResolver], component: UserDetailComponent },
      { path: 'calendar',  component: CalendarComponent}, 
      { path: 'zdravotnaKarta',
      resolve: {
        healthRecord: HealthRecordResolver
      },  
      component: HealthRecordShellComponent}
    ],
  },
];


@NgModule({
    imports: [RouterModule.forChild(patientRoutes)],
    exports: [RouterModule]


})
export class PatientRouting {}