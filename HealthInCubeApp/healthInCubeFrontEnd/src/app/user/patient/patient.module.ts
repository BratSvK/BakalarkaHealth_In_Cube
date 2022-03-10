import { NgModule } from "@angular/core";
import { NavPatientComponent } from "../../nav/nav-patient/nav-patient.component";
import { SharedModule } from "src/app/shared/shared.module";
import { PatientRouting } from "./patient-routing.module";
import { PatientComponent } from "./patient.component";
import { UserNotActivatedWarningComponent } from './user-not-activated-warning/user-not-activated-warning.component';
import { UserDetailModule } from "../user-detail/user-detail.module";
import { HealthRecordShellComponent } from './health-record/health-record-shell/health-record-shell.component';

@NgModule({
    declarations: [
      NavPatientComponent, 
      PatientComponent, 
      UserNotActivatedWarningComponent, 
      HealthRecordShellComponent
    ],
    imports: [
      SharedModule, 
      PatientRouting,
      UserDetailModule,
    ]
  })
  export class PatientModule {}
  