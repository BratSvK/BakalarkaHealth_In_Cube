import { NgModule } from "@angular/core";
import { SharedModule } from "src/app/shared/shared.module";
import { UserBydliskoEditorComponent } from "./user-bydlisko-editor/user-bydlisko-editor.component";

@NgModule({
    declarations: [UserBydliskoEditorComponent],
    imports: [SharedModule],
    exports: [UserBydliskoEditorComponent]
  })
  export class PatientModule {}
  