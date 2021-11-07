import { Injectable } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';

@Injectable({
  providedIn: 'root'
})
export class BusyService {

  // we can have multiple requests in time 
  busyRequestsCount = 0;

  constructor(private spinnerService: NgxSpinnerService) { }


  busy() {
    this.busyRequestsCount++;
    this.spinnerService.show(undefined, {
      type: 'square-jelly-box',
      bdColor: 'rgba(255,255,255,0)',
      color: '#007bff',
    });
  }


  idle() {
    this.busyRequestsCount--;

    // safetly first not to be -1 to be 
    if (this.busyRequestsCount <= 0) {
      this.busyRequestsCount = 0;
      this.spinnerService.hide();
    }
  }
}
