import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { ZdravotnaKarta } from '../models/pacient/zdravotnaKarta/zdravotnaKarta';
import { PACIENT_API } from '../_constants/endPointsApi';

@Injectable({
  providedIn: 'root'
})
export class HealthRecordService {
  baseUrl = environment.apiUrl;
  zdravotnaKartaCache = new Map();


  constructor(private http: HttpClient) {
  }

  getHealthRecord$(idPacient: number): Observable<ZdravotnaKarta> {

    var response = this.zdravotnaKartaCache.get('zdravotnaKarta');
    if (response) {
      return of(response);
    }
    
    return this.http.get<ZdravotnaKarta>(this.baseUrl + `${PACIENT_API}/${idPacient}/zdravotnaKarta`)
    .pipe(
      map(response => {
        this.zdravotnaKartaCache.set('zdravotnaKarta', response);
        return response;
      }));
    }
  }

