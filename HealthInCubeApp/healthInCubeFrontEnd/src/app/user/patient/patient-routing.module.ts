import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { CalendarComponent } from "../calendar/calendar.component";
import { UserDetailResolver } from "../user-detail/user-detail-resolver.service";
import { UserDetailComponent } from "../user-detail/user-detail.component";
import { PatientComponent } from "./patient.component";

const patientRoutes: Routes = [
  {
    path: '',
    component: PatientComponent,
    children: [
      // { path: '', pathMatch: 'full', redirectTo: 'zdravotnaKarta' },
      { path: 'edit', resolve: [UserDetailResolver], component: UserDetailComponent },
      { path: 'calendar',  component: CalendarComponent},
      { path: 'zdravotnaKarta', loadChildren: () => import('./health-record/health-record.module').then((m)=>m.HealthRecordModule)}
    ],
  },
];


@NgModule({
    imports: [RouterModule.forChild(patientRoutes)],
    exports: [RouterModule]


})
export class PatientRouting {}