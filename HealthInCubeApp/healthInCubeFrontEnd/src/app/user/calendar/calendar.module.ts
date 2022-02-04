import { NgModule } from "@angular/core";
import { ScheduleModule } from "@syncfusion/ej2-angular-schedule";
import { SharedModule } from "src/app/shared/shared.module";
import { CalendarComponent } from './calendar.component';
import { DayService, WeekService } from '@syncfusion/ej2-angular-schedule';

@NgModule({
    declarations: [CalendarComponent],
    imports: [
      SharedModule,
      ScheduleModule
    ],
    exports: [
      CalendarComponent 
    ],
    providers: [DayService, WeekService]
  })
  export class CalendarModule {}
  