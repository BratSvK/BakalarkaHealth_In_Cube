import { DatePipe } from '@angular/common';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { Store } from '@ngrx/store';
import * as _moment from 'moment';
import { Observable } from 'rxjs';
import { map, switchMap } from 'rxjs/operators';
import { SprievodkaLekarModel, SprievodkaModel, SprievodkaPacientModel } from 'src/app/models/sprievodka/sprievodkaModel';
import { SprievodkaParams } from 'src/app/models/sprievodka/sprievodkaParams';
import { LekarService } from 'src/app/_service/lekar.service';
import { PatientService } from 'src/app/_service/patient.service';
import { SprievodkaService } from 'src/app/_service/sprievodka.service';
import { AppState } from 'src/app/_store/models/AppState';
import { SubSink } from 'subsink';


const moment = _moment;

@Component({
  selector: 'app-calendar',
  templateUrl: './calendar.component.html',
  styleUrls: ['./calendar.component.css']
})
export class CalendarComponent implements OnInit,OnDestroy {

  selectedDayInWeek = new FormControl();
  sprievodkyList: SprievodkaModel[];
  currentView: any;
  weekArray: string[] = [];
  isActivated$: Observable<boolean>;
  lekarId$: Observable<number>;
  hours: Array<number>;
  isPatient: boolean = false;
  currentDate = new Date(moment().isoWeekday(1).startOf('isoWeek').toDate());

  // Datepicker takes `Moment` objects instead of `Date` objects.
  date =  new FormControl([
    new Date(this.currentDate),
    new Date(this.currentDate.setDate(this.currentDate.getDate() + 6))
  ]);

  private subs = new SubSink();
  
  constructor(
    private sprievodkyService: SprievodkaService,
    private router: Router,
    public datepipe: DatePipe,
    private lekarService: LekarService,
    private patientService: PatientService,
    private store: Store<AppState>,
  ) { }

  ngOnDestroy(): void {
    this.subs.unsubscribe();
  }

  ngOnInit(): void {
    if (this.router.url.split('/')[1] === 'patient')
    this.isActivated$ = this.patientService.checkIsActiveted$();
    this.lekarId$ = this.lekarService.getLoginDoctorId$();
    this.getInitialInfo();
  }

  addWeek(): void {
    var nextDate = new FormControl([
      moment(this.date.value[0]).add(1, 'week').toDate(),
      moment(this.date.value[1]).add(1, 'week').toDate()
    ]);

    if (nextDate)
    this.date.patchValue(nextDate.value);
  }

  subtractWeek(): void {
    var previousDate = new FormControl([
      moment(this.date.value[0]).subtract(1, 'week').toDate(),
      moment(this.date.value[1]).subtract(1, 'week').toDate()
    ]);

    if (previousDate)
    this.date.patchValue(previousDate.value);
  }

  getInitialInfo() {
    moment.locale('sk'); 
    this.getDays();
    this.createHoursTable();
    this.initSprievodky();
  }

  initSprievodky() {
    let urlSegments = this.router.url.split('/');
    let userId = +urlSegments[2];
    let sprievodkaParams = this.buildSprievodkaParams();

    if (userId && sprievodkaParams) {
      if (urlSegments[1] === 'patient') {
       this.subs.sink = this.store.select('patient')
       .pipe(
         map(patientData => {
           return patientData.activatedPatient.idPacient
         }),
         switchMap(patientId => {
           sprievodkaParams.idPacient = patientId;
           this.isPatient = true;
           return this.sprievodkyService.getSprievodkyByParams(sprievodkaParams);
         })
       ).subscribe(sprievodky => {
         this.sprievodkyList = sprievodky;
       });
      } else {
        this.subs.sink = this.lekarService.getDoctorIdByUserId()
        .pipe(
          switchMap(doctorId => {
            sprievodkaParams.idLekar = doctorId;
            this.isPatient = false;
            return this.sprievodkyService.getSprievodkyByParams(sprievodkaParams);
          })
        ).subscribe(sprievodky => {
          this.sprievodkyList = sprievodky;
        });
      }
  }
}

  getCurrentSprievodka(day: number, hour: number): SprievodkaPacientModel | SprievodkaLekarModel {
    let sprievodka = this.sprievodkyList?.filter(
      s => moment(new Date(s.terminOd)).weekday() === day 
        && moment(new Date(s.terminOd)).hour() === hour)[0];
    return this.isPatient ? sprievodka as SprievodkaPacientModel : sprievodka as SprievodkaLekarModel;
  }

  onWheel(event: WheelEvent): void {
    if (event.deltaY > 0) document.getElementById('table')!.scrollLeft += 55;
    else document.getElementById('table')!.scrollLeft -= 55;
    event.preventDefault();
  }

  private createHoursTable(): void {
    this.hours = new Array();
    for (let index = 6; index < 19; index++) {
      this.hours.push(index);
    }
  }

  private getDays() {
    this.weekArray = moment.weekdays();
  }

  private buildSprievodkaParams() : SprievodkaParams {
    let sprievodka = new SprievodkaParams();
    const latestDate = this.datepipe.transform(this.date.value[0], 'yyyy-MM-dd');
    sprievodka.startWeekBy = latestDate;
    return sprievodka;
    }
}

