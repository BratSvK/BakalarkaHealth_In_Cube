import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { ActionEventArgs, ScheduleComponent } from '@syncfusion/ej2-angular-schedule';
import { BehaviorSubject, Observable } from 'rxjs';
import { SprievodkaModel } from 'src/app/models/sprievodka/sprievodkaModel';
import { SprievodkaParams } from 'src/app/models/sprievodka/sprievodkaParams';
import { SprievodkaService } from 'src/app/_service/sprievodka.service';

@Component({
  selector: 'app-calendar',
  templateUrl: './calendar.component.html',
  styleUrls: ['./calendar.component.css']
})
export class CalendarComponent implements OnInit {
  @ViewChild("scheduleObj", { static: false }) scheduleObj: ScheduleComponent;

  selectedDayInWeek = new FormControl();
  sprievodkyList$: Observable<SprievodkaModel[]>;
  currentView: any;
  
  constructor(
    private sprievodkyService: SprievodkaService,
    private router: Router
  ) { }

  ngOnInit(): void {
    
  }

  public showSprievodkyInSelectedWeek(): void {
    this.initSprievodky();
  }

  private initSprievodky() {
    let sprievodkaParams = this.buildSprievodkaParams();
    console.log(sprievodkaParams);
    this.sprievodkyList$ = this.sprievodkyService.getSprievodkyByParams(sprievodkaParams);
  }

  private buildSprievodkaParams() : SprievodkaParams {
    let urlSegments = this.router.url.split('/');
    let sprievodka = new SprievodkaParams();

    // tu potrebujem dostat bud id lekar alebo id patient
    if (urlSegments[1] === 'patient') {
        sprievodka.idPacient = +urlSegments[2];
    } else {
        sprievodka.idLekar = +urlSegments[2];
    }
    sprievodka.startWeekBy = this.scheduleObj?.selectedDate.toISOString();
    return sprievodka;
  }
}
