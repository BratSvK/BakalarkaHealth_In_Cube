import { NgModule } from "@angular/core";
import { SharedModule } from "src/app/shared/shared.module";
import { CalendarComponent } from './calendar.component';
import { MatIconModule } from '@angular/material/icon';
import { DatePipe } from "@angular/common";


@NgModule({
    declarations: [CalendarComponent],
    imports: [
      SharedModule,
      MatIconModule
    ],
    exports: [
      CalendarComponent 
    ],
    providers: [
      DatePipe
    ]
  })
  export class CalendarModule {}
  