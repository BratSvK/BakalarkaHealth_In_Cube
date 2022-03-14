import { NgModule } from "@angular/core";
import { SharedModule } from "src/app/shared/shared.module";
import { CalendarComponent } from './calendar.component';
import { MatIconModule } from '@angular/material/icon';
import { CalendarItemComponent } from './calendar-item/calendar-item.component';
import { DatePipe } from "@angular/common";
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from "@angular/material/form-field";
import { ModalLekarComponent } from './calendar-item/calendar-item-modal/modal-lekar/modal-lekar.component';
import { ModalPacientComponent } from './calendar-item/calendar-item-modal/modal-pacient/modal-pacient.component';
import { CalendarChangedModalComponent } from './calendar-changed-modal/calendar-changed-modal.component';
import { NgAnimatedBorderModule } from "ng-animated-border";
import { IsAllowedDenyAppointment } from "src/app/_directives/is-allowed-deny-appointment.directive";
import { LekarRoutingModule } from "../lekar/lekar-routing.module";


@NgModule({
    declarations: [
      CalendarComponent, 
      CalendarItemComponent, 
      ModalLekarComponent,
      ModalPacientComponent,
      CalendarChangedModalComponent,
      IsAllowedDenyAppointment
    ],
    imports: [
      SharedModule,
      MatIconModule,
      MatFormFieldModule,
      MatInputModule,
      NgAnimatedBorderModule,
      LekarRoutingModule
    ],
    exports: [
      CalendarComponent
    ],
    providers: [
      DatePipe
    ]
  })
  export class CalendarModule {}
  