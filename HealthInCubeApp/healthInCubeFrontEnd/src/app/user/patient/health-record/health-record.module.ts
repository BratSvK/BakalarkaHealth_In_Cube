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
import { HealthRecordVysetreniaEditComponent } from './health-record-patient-vysetrenia/health-record-vysetrenia-edit/health-record-vysetrenia-edit.component';
import { HealthRecordVysetreniaItemComponent } from './health-record-patient-vysetrenia/health-record-vysetrenia-item/health-record-vysetrenia-item.component';
import { HealthRecordVysetreniaCreateComponent } from './health-record-patient-vysetrenia/health-record-vysetrenia-create/health-record-vysetrenia-create.component';
import { VysetrenieDownloadAttachmentComponent } from './health-record-patient-vysetrenia/health-record-vysetrenia-edit/vysetrenie-download-attachment/vysetrenie-download-attachment.component';
import { PredLiecbaZoznamComponent } from './health-record-patient-vysetrenia/health-record-vysetrenia-edit/pred-liecba-zoznam/pred-liecba-zoznam.component';
import { PredLiecbaZoznamItemComponent } from './health-record-patient-vysetrenia/health-record-vysetrenia-edit/pred-liecba-zoznam/pred-liecba-zoznam-item/zoznam-item.component';
import { AccordionModule } from "ngx-bootstrap/accordion";
import { ZoznamItemAccordionBodyComponent } from './health-record-patient-vysetrenia/health-record-vysetrenia-edit/pred-liecba-zoznam/pred-liecba-zoznam-item/accord-body/accordion-body.component';
import { ZoznamItemReceptModalComponent } from './health-record-patient-vysetrenia/health-record-vysetrenia-edit/pred-liecba-zoznam/pred-liecba-zoznam-item/recept-modal/recept-modal.component';
import { VysetreniaReceptLiekItemComponent } from './health-record-patient-vysetrenia/vysetrenia-recept-liek-item/vysetrenia-recept-liek-item.component';

@NgModule({
    declarations: [
      HealthRecordPatientDetailComponent,
      HealthRecordPatientInfoComponent,
      HealthRecordPatientVysetreniaComponent,
      HealthRecordPatientWelcomeComponent,
      IfAuthorizedToDirective,
      HealthRecordPractitionerInfoComponent,
      HealthRecordPatientChorobyComponent,
      HealthRecordVysetreniaEditComponent,
      HealthRecordVysetreniaItemComponent,
      HealthRecordVysetreniaCreateComponent,
      VysetrenieDownloadAttachmentComponent,
      PredLiecbaZoznamComponent,
      PredLiecbaZoznamItemComponent,
      ZoznamItemAccordionBodyComponent,
      ZoznamItemReceptModalComponent,
      VysetreniaReceptLiekItemComponent
    ],
    imports: [
      SharedModule, 
      ScrollingModule,
      HealthRecordRoutingModule,
      ClipboardModule,
      AccordionModule.forRoot(),
    ]
  })
  export class HealthRecordModule {}
  