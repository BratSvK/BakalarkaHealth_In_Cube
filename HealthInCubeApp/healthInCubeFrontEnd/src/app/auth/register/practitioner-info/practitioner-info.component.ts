import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Subscription } from 'rxjs';
import { Lekar } from 'src/app/models/lekar';
import { AppState } from 'src/app/_store/models/AppState';
import * as PractitionerBundleActions from './store/practitioner-info.actions';


@Component({
  selector: 'app-practitioner-info',
  templateUrl: './practitioner-info.component.html',
  styleUrls: ['./practitioner-info.component.css']
})
export class PractitionerInfoComponent implements OnInit, OnDestroy {

  @Input() practitionerId: number;
  practitioner: Lekar = null;

  infoSub: Subscription;


  constructor(private store: Store<AppState>) {
    this.store.dispatch(new PractitionerBundleActions.FetchPractitioner(this.practitionerId));
    
   }
 

  ngOnInit(): void {
    if (this.practitionerId > 0 ) {
      this.infoSub = this.store.select('practitionerInfo').subscribe(practionerStateData => {
        this.practitioner = practionerStateData.registerLekar;
      });
      }
  }



  ngOnDestroy(): void {
    this.infoSub.unsubscribe();
  }




  

}
