import { EventEmitter, Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class HealthRecordVysetrenieService {
  downloadAttacmentStarted$: EventEmitter<number> = new EventEmitter<number>();

  constructor() {
  }

}

  
