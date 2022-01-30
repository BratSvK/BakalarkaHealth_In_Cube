import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { LekarTyp } from '../models/lekar/typLekar';

/*
  Service for getting lekar id as singleton for all app runnging with local storage.
*/
@Injectable({
  providedIn: 'root'
})
export class LekarIdService {
  private storageName: string = "lekarId";

  constructor() { }

  setId(data: number) {
    localStorage.setItem(this.storageName, JSON.stringify(data));
  }

  getLekarId() {
    let data = localStorage.getItem(this.storageName);
    return JSON.parse(data);
  }

  clearLekarId() {
    localStorage.removeItem(this.storageName);
  }
}
