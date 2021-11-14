import { NgModule } from "@angular/core";
import { NavPatientComponent } from "../../nav/nav-patient/nav-patient.component";
import { SharedModule } from "src/app/shared/shared.module";
import { PatientRouting } from "./patient-routing.module";
import { PatientComponent } from "./patient.component";

@NgModule({
    declarations: [NavPatientComponent, PatientComponent],
    imports: [SharedModule, PatientRouting]
  })
  export class PatientModule {}
  