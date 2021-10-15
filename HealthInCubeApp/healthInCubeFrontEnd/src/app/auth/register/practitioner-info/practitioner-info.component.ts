import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Lekar } from 'src/app/models/lekar';
import { DomSanitizer } from '@angular/platform-browser';
import { extractFotoFromApi } from 'src/app/shared/foto-extract';


@Component({
  selector: 'app-practitioner-info',
  templateUrl: './practitioner-info.component.html',
  styleUrls: ['./practitioner-info.component.css']
})
export class PractitionerInfoComponent implements OnInit, OnDestroy {

  @Input() practitioner: Lekar;
  image: any;



  constructor(private sanitizer: DomSanitizer) {
    
    
   }
 

  ngOnInit(): void {
    
    if (this.practitioner.fotka) 
      this.image = extractFotoFromApi(this.practitioner.fotka, this.sanitizer);
    
    
  }



  ngOnDestroy(): void {
    // this.infoSub.unsubscribe();
  }




  

}
