import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { SPRIEVODKA_API } from '../_constants/endPointsApi';

@Injectable({
  providedIn: 'root'
})
export class SprievodkaService {
  baseUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  chechAvailabilityInDay(idLekar: number, termin: string): Observable<boolean> {
    let params = new HttpParams();
    params = params.append('idLekar', idLekar.toString());
    params = params.append('terminDatum', termin.toString());

    return this.http.get<boolean>(this.baseUrl + `${SPRIEVODKA_API}/availability`, {params: params});
  }
}
