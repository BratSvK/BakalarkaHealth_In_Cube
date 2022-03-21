import { ScrollingModule } from "@angular/cdk/scrolling";
import { NgModule } from "@angular/core";
import { SharedModule } from "src/app/shared/shared.module";
import { HealthRecordPatientDetailComponent } from "./health-record-patient-detail/health-record-patient-detail.component";
import { HealthRecordRoutingModule } from "./health-record-routing.module";
import { HealthRecordPatientInfoComponent } from './health-record-patient-detail/health-record-patient-info/health-record-patient-info.component';
import { HealthRecordPatientVysetreniaComponent } from './health-record-patient-vysetrenia/health-record-patient-vysetrenia.component';
import { HealthRecordPatientWelcomeComponent } from './health-record-patient-welcome/health-record-patient-welcome.component';
import { IfAuthorizedToDirective } from "src/app/_directives/if-authorized-to.directive";
import { ClipboardModule } from 'ngx-clipboard';
import { HealthRecordPractitionerInfoComponent } from './health-record-patient-detail/health-record-practitioner-info/health-record-practitioner-info.component';
import { HealthRecordPatientChorobyComponent } from './health-record-patient-choroby/health-record-patient-choroby.component';

@NgModule({
    declarations: [
      HealthRecordPatientDetailComponent,
      HealthRecordPatientInfoComponent,
      HealthRecordPatientVysetreniaComponent,
      HealthRecordPatientWelcomeComponent,
      IfAuthorizedToDirective,
      HealthRecordPractitionerInfoComponent,
      HealthRecordPatientChorobyComponent
    ],
    imports: [
      SharedModule, 
      ScrollingModule,
      HealthRecordRoutingModule,
      ClipboardModule
    ]
  })
  export class HealthRecordModule {}
  