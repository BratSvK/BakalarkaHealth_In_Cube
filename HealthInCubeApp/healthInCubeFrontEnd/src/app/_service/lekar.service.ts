import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { LekarSprievodka } from '../models/lekar/lekarSprievodka';
import { LekarTyp } from '../models/lekar/typLekar';
import { LEKAR_API } from '../_constants/endPointsApi';

@Injectable({
  providedIn: 'root'
})
export class LekarService {
  baseUrl = environment.apiUrl;
  typeOfLekarCache = new Map();

  constructor(private http: HttpClient) { }

  getDoctorIdByUserId() {
    return this.http.get<number>(this.baseUrl + `${LEKAR_API}/id`);
  }

  getLekarTypes(): Observable<LekarTyp[]> {
    var response = this.typeOfLekarCache.get('type');
    if (response) {
      return of(response);
    }
    
    return this.http.get<LekarTyp[]>(this.baseUrl + `${LEKAR_API}/types`).pipe(
      map(response => {
        this.typeOfLekarCache.set('type', response);
        return response;
      })
    );
  }

  getDoctorsByType(idTyp: number): Observable<LekarSprievodka[]> {
    return this.http.get<LekarSprievodka[]>(this.baseUrl + `${LEKAR_API}/all/${idTyp}`)
  }
}
