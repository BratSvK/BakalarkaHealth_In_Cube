import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { LekarSprievodka } from '../models/lekar/lekarSprievodka';
import { LekarTyp } from '../models/lekar/typLekar';
import { LEKAR_API } from '../_constants/endPointsApi';

@Injectable({
  providedIn: 'root'
})
export class LekarService {
  baseUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getDoctorIdByUserId() {
    return this.http.get<number>(this.baseUrl + `${LEKAR_API}/id`);
  }

  getLekarTypes(): Observable<LekarTyp[]> {
    return this.http.get<LekarTyp[]>(this.baseUrl + `${LEKAR_API}/types`);
  }

  getDoctorsByType(idTyp: number): Observable<LekarSprievodka[]> {
    return this.http.get<LekarSprievodka[]>(this.baseUrl + `${LEKAR_API}/all/${idTyp}`)
  }
}
