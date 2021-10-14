import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Lekar } from 'src/app/models/lekar';


@Component({
  selector: 'app-practitioner-info',
  templateUrl: './practitioner-info.component.html',
  styleUrls: ['./practitioner-info.component.css']
})
export class PractitionerInfoComponent implements OnInit, OnDestroy {

  @Input() practitioner: Lekar;



  constructor() {
    
    
   }
 

  ngOnInit(): void {
    console.log(this.practitioner);
  }



  ngOnDestroy(): void {
    // this.infoSub.unsubscribe();
  }




  

}
