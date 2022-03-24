import { EventEmitter, Injectable } from '@angular/core';
import { PacientCard } from '../models/pacient/pacientCard';

@Injectable({
  providedIn: 'root'
})
export class HealthRecordVysetrenieService {
  downloadAttacmentStarted$: EventEmitter<number> = new EventEmitter<number>();
  protected pacientDetail: PacientCard;

  constructor() {
  }

  getPacientDetail(): PacientCard {
    return this.pacientDetail;
  }

  setPacientDetail(pacientDetail: PacientCard) {
    if (!!pacientDetail)
    this.pacientDetail = {...pacientDetail};
  }

  clearPacientDetail() {
    this.pacientDetail = {} as PacientCard;
  }

}

  
