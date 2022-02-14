import { NgModule } from "@angular/core";
import { SharedModule } from "src/app/shared/shared.module";
import { PhotoEditorComponent } from "./photo-editor/photo-editor.component";
import { UserBydliskoEditorComponent } from "./user-bydlisko-editor/user-bydlisko-editor.component";
import { UserDetailComponent } from "./user-detail.component";

@NgModule({
    declarations: [
      UserBydliskoEditorComponent,
      UserDetailComponent,
      PhotoEditorComponent,
    ],
    imports: [SharedModule],
    exports: [
      UserBydliskoEditorComponent,
      PhotoEditorComponent,
      UserDetailComponent
    ]
  })
  export class UserDetailModule {}
  