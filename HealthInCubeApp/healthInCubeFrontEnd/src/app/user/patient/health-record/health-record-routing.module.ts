import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { HealthRecordPatientDetailComponent } from "./health-record-patient-detail/health-record-patient-detail.component";
import { HealthRecordPatientVysetreniaComponent } from "./health-record-patient-vysetrenia/health-record-patient-vysetrenia.component";
import { HealthRecordPatientWelcomeComponent } from "./health-record-patient-welcome/health-record-patient-welcome.component";
import { HealthRecordResolver } from "./health-record-resolver.service";
import { HealthRecordShellComponent } from "./health-record-shell/health-record-shell.component";


const healthRecordRoutes: Routes = [
  {
    path: '',
    component: HealthRecordShellComponent,
    resolve: {
      healthRecord: HealthRecordResolver
    },  
    children: [
      { path: '', pathMatch: 'full', redirectTo: 'health-record' },
      { path: 'health-record', component: HealthRecordPatientWelcomeComponent },
      { path: 'patient-detail', component: HealthRecordPatientDetailComponent },
      { path: 'patient-vysetrenia', component: HealthRecordPatientVysetreniaComponent }
    ]
  }
];


@NgModule({
    imports: [RouterModule.forChild(healthRecordRoutes)],
    exports: [RouterModule]
})
export class HealthRecordRoutingModule {}