import { Component, Input, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { map, take } from 'rxjs/operators';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { AppState } from 'src/app/_store/models/AppState';
import { faCalendarPlus } from '@fortawesome/free-solid-svg-icons';




@Component({
  selector: 'app-nav-patient',
  templateUrl: './nav-patient.component.html',
  styleUrls: ['./nav-patient.component.css']
})
export class NavPatientComponent implements OnInit {
  calendar = faCalendarPlus;

  @Input() isActivatedPatientFlag$: Observable<boolean>;
  
  isCollapsed = false;
  user: Pouzivatel;
  image: any;

  constructor(private store: Store<AppState>) {
   }

  ngOnInit(): void {
    this.store.select('auth').pipe(take(1),map(resData => {
            return resData.user;
          })).subscribe(user => {
            this.user = user;
          });
  }

  
}
