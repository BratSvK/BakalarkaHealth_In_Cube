import { NgModule } from "@angular/core";
import { SharedModule } from "src/app/shared/shared.module";
import { PatientRouting } from "./patient-routing.module";

@NgModule({
    declarations: [],
    imports: [SharedModule, PatientRouting],
  })
  export class PatientModule {}
  