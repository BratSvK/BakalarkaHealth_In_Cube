import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Nemocnica } from '../models/nemocnica/nemocnica';
import { NEMOCNICA_API } from '../_constants/endPointsApi';

@Injectable({
  providedIn: 'root'
})
export class NemocnicaService {
  baseUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getNemocnice$(): Observable<Nemocnica[]> {
    return this.http.get<Nemocnica[]>(this.baseUrl + `${NEMOCNICA_API}/all`)
    }
}
