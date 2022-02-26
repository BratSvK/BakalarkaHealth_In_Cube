import { NgModule } from "@angular/core";
import { NavAdminComponent } from "src/app/nav/nav-admin/nav-admin.component";
import { SharedModule } from "src/app/shared/shared.module";
import { AdminRoutingModule } from "./admin-routing.module";
import { AdminComponent } from './admin.component';
import { DoctorRequestsComponent } from "./doctor-requests/doctor-requests.component";


@NgModule({
    declarations: [
      AdminComponent,
      NavAdminComponent,
      DoctorRequestsComponent
    ],
    imports: [
      SharedModule,
      AdminRoutingModule 
    ]
  })
  export class AdminModule {}
  