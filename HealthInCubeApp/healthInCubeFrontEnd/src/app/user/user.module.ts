import { NgModule } from '@angular/core';
import { SharedModule } from '../shared/shared.module';
import { UserRouting } from './user-routing.module';
import { UserComponent } from './user.component';
import { PatientComponent } from './patient/patient.component';
import { LekarComponent } from './lekar/lekar.component';
import { ZiadankyComponent } from './lekar/ziadanky/ziadanky.component';

@NgModule({
  declarations: [UserComponent, PatientComponent, LekarComponent],
  imports: [SharedModule, UserRouting],
})
export class UserModule {}
