import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { ZoznamDen, ZoznamDenModel } from '../models/lekar/pracovnaDoba/pracDoba-zoznamDen';
import { extractKeyFromParams } from '../shared/common';
import { PRACOVNA_DOBA_API } from '../_constants/endPointsApi';

@Injectable({
  providedIn: 'root'
})
export class PracovnaDobaService {
  baseUrl = environment.apiUrl;
  pracovnaDobaCache = new Map();

  constructor(private http: HttpClient) { }

  getPracovnaDobaDniZoznam$(): Observable<ZoznamDenModel[]> {
    var defaultPracovnaDobaDen = new ZoznamDen(-1,'');
    const keyFromParams = extractKeyFromParams(defaultPracovnaDobaDen);
    var response = this.pracovnaDobaCache.get(keyFromParams);
    if (response) {
      return of(response);
    }

    return this.http.get<ZoznamDen[]>(this.baseUrl + `${PRACOVNA_DOBA_API}/list/days`)
    .pipe(
      map(response => {
        this.pracovnaDobaCache.set(keyFromParams, response);
        return response;
      }));
    }

    clearZoznamDniCache() {
      this.pracovnaDobaCache.clear();
    }
}
