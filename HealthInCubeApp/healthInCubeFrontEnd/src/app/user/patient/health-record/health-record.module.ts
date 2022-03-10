import { ScrollingModule } from "@angular/cdk/scrolling";
import { NgModule } from "@angular/core";
import { SharedModule } from "src/app/shared/shared.module";
import { HealthRecordPatientDetailComponent } from "./health-record-patient-detail/health-record-patient-detail.component";
import { HealthRecordRoutingModule } from "./health-record-routing.module";
import { HealthRecordPatientInfoComponent } from './health-record-patient-detail/health-record-patient-info/health-record-patient-info.component';
import { HealthRecordPatientVysetreniaComponent } from './health-record-patient-vysetrenia/health-record-patient-vysetrenia.component';
import { HealthRecordPatientWelcomeComponent } from './health-record-patient-welcome/health-record-patient-welcome.component';

@NgModule({
    declarations: [
      HealthRecordPatientDetailComponent,
      HealthRecordPatientInfoComponent,
      HealthRecordPatientVysetreniaComponent,
      HealthRecordPatientWelcomeComponent
    ],
    imports: [
      SharedModule, 
      ScrollingModule,
      HealthRecordRoutingModule
    ]
  })
  export class HealthRecordModule {}
  