import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { CreatePatient } from '../models/createPatient';
import { ZiadankaLekar } from '../models/ziadanka/ziadankaLekar';
import { ZiadankaParams } from '../models/ziadanka/ziadankaParams';
import { extractKeyFromParams } from '../shared/common';
import { SPRAVCA_API } from '../_constants/endPointsApi';

@Injectable({
  providedIn: 'root'
})
export class AdminService {
  baseUrl = environment.apiUrl;
  sprievodkaCache = new Map();

  constructor(private http: HttpClient) { }


  
  getSprievodkyByParams$(ziadankyParms: ZiadankaParams): Observable<ZiadankaLekar[]> {
    const keyFromParams = extractKeyFromParams(ziadankyParms);
    var response = this.sprievodkaCache.get(keyFromParams);
    if (response) {
      return of(response);
    }
    let params = new HttpParams();

    
    params = params.append('idNemocnica', ziadankyParms.idNemocnica.toString());
    return this.http.get<ZiadankaLekar[]>(this.baseUrl + `${SPRAVCA_API}/request/list`, {params: params})
    .pipe(
      map(response => {
        this.sprievodkaCache.set(keyFromParams, response);
        return response;
      }));
    }

    activateDoctorAccount(createPatient: CreatePatient) {
      return this.http.post(this.baseUrl + `${SPRAVCA_API}/activateDoctorAccount` , createPatient);
    }

    removeFromCache(idNemocnica: number) {
      const keyFromParams = extractKeyFromParams(new ZiadankaParams(idNemocnica));
      this.sprievodkaCache.delete(keyFromParams);
    }

    clearCacheOfRequests() {
      this.sprievodkaCache.clear();
    }
}
