import { ApplicationInitStatus, Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Store } from '@ngrx/store';
import { Observable, Subscription } from 'rxjs';
import { map, switchMap, take } from 'rxjs/operators';
import { PacientCard } from 'src/app/models/pacientCard';
import { PatientsService } from 'src/app/_service/patients.service';
import { AppState } from 'src/app/_store/models/AppState';

@Component({
  selector: 'app-pacienti-list',
  templateUrl: './pacienti-list.component.html',
  styleUrls: ['./pacienti-list.component.css']
})
export class PacientiListComponent implements OnInit, OnDestroy {

  patients$: Observable<PacientCard[]>;
  sub: Subscription
  idLekar: number;

  constructor(private route: ActivatedRoute) { 
    this.patients$ = this.route.data.pipe(switchMap((data) => data.patients$ as Observable<PacientCard[]>));
  }
 
  ngOnInit(): void {
   
  }

  ngOnDestroy(): void {

  }
}
