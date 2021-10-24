import { NgModule } from '@angular/core';
import { SharedModule } from '../shared/shared.module';
import { UserRouting } from './user-routing.module';
import { UserComponent } from './user.component';
import { PatientComponent } from './patient/patient.component';
import { LekarComponent } from './lekar/lekar.component';
import { NavComponent } from '../nav/nav.component';


@NgModule({
  declarations: [UserComponent,NavComponent, PatientComponent, LekarComponent],
  imports: [SharedModule, UserRouting],
})
export class UserModule {}
