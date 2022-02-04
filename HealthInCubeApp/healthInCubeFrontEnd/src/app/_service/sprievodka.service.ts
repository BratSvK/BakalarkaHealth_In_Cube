import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { SprievodkaCreateModelApi } from '../models/sprievodka/sprievodkaFormModel';
import { SprievodkaModel } from '../models/sprievodka/sprievodkaModel';
import { SprievodkaParams } from '../models/sprievodka/sprievodkaParams';
import { extractKeyFromParams } from '../shared/common';
import { SPRIEVODKA_API } from '../_constants/endPointsApi';

@Injectable({
  providedIn: 'root'
})
export class SprievodkaService {
  baseUrl = environment.apiUrl;
  sprievodkaCache = new Map();

  constructor(private http: HttpClient) { }

  createSprievodka(sprievodkaForm: SprievodkaCreateModelApi) {
    return this.http.post(this.baseUrl + `${SPRIEVODKA_API}/create`, sprievodkaForm);
  }

  chechAvailabilityInDay(idLekar: number, termin: string): Observable<boolean> {
    let params = new HttpParams();
    params = params.append('idLekar', idLekar.toString());
    params = params.append('terminDatum', termin.toString());

    return this.http.get<boolean>(this.baseUrl + `${SPRIEVODKA_API}/availability`, {params: params});
  }

  getSprievodkyByParams(sprievodkaParams: SprievodkaParams): Observable<SprievodkaModel[]> {

    const keyFromParams = extractKeyFromParams(sprievodkaParams);
    var response = this.sprievodkaCache.get(keyFromParams);
    console.log(response);

    if (response) {
      return of(response);
    }
    
    let params = new HttpParams();

    if (sprievodkaParams.idLekar) {
      params = params.append('idLekar', sprievodkaParams.idLekar.toString());
    }

    if (sprievodkaParams.idPacient) {
      params = params.append('idPacient', sprievodkaParams.idPacient.toString());
    }
    params = params.append('startWeekBy', sprievodkaParams.startWeekBy.toString());

    return this.http.get<SprievodkaModel[]>(this.baseUrl + `${SPRIEVODKA_API}/byWeek`, {params: params})
    .pipe(
      map(response => {
        this.sprievodkaCache.set(keyFromParams, response);
        return response;
      }));
    }
}
