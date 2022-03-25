import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { Choroba } from '../models/pacient/zdravotnaKarta/zapChoroby/choroba';
import { Liek } from '../models/pacient/zdravotnaKarta/zapChoroby/liek/liek';
import { ZdravotnaKarta, ZdravotnaKartaPatchModel } from '../models/pacient/zdravotnaKarta/zdravotnaKarta';
import { ZDRAVOTNA_KARTA_API } from '../_constants/endPointsApi';

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
    
    return this.http.get<ZdravotnaKarta>(this.baseUrl + `${ZDRAVOTNA_KARTA_API}/${idPacient}`)
    .pipe(
      map(response => {
        this.zdravotnaKartaCache.set('zdravotnaKarta', response);
        return response;
      }));
    }

    searchChorobyByName$(name: string): Observable<Choroba[]> {
      let params = new HttpParams();
      params = params.append('name', name);
      return this.http.get<Choroba[]>(this.baseUrl + `${ZDRAVOTNA_KARTA_API}/choroba/find`, {params: params});
    }

    searchLiekyByName$(name: string): Observable<Liek[]> {
      let params = new HttpParams();
      params = params.append('name', name);
      return this.http.get<Liek[]>(this.baseUrl + `${ZDRAVOTNA_KARTA_API}/lieky/find`, {params: params});
    }


    clearHealthRecordCache() {
      if (this.zdravotnaKartaCache)
      this.zdravotnaKartaCache.clear();
    }

    updateHealthRecord(idPacient: number, patch: ZdravotnaKartaPatchModel) {
      return this.http.patch(this.baseUrl + `${ZDRAVOTNA_KARTA_API}/${idPacient}/update`, patch.patchModel);
    }
  }

  
