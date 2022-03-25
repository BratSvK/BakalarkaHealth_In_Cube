import { HttpClient } from '@angular/common/http';
import { EventEmitter, Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { PacientCard } from '../models/pacient/pacientCard';
import { Balenie } from '../models/pacient/zdravotnaKarta/zapChoroby/liek/balenie/balenie';
import { PriznakBuilder, TypPriznak } from '../models/pacient/zdravotnaKarta/zapChoroby/priznakChoroba';
import { extractKeyFromParams } from '../shared/common';
import { ZDRAVOTNA_KARTA_API } from '../_constants/endPointsApi';

@Injectable({
  providedIn: 'root'
})
export class HealthRecordVysetrenieService {
  downloadAttacmentStarted$: EventEmitter<number> = new EventEmitter<number>();
  protected pacientDetail: PacientCard;

  baseUrl = environment.apiUrl;
  priznakyCache = new Map();


  constructor(private http: HttpClient) {
  }

  getPacientDetail(): PacientCard {
    return this.pacientDetail;
  }

  setPacientDetail(pacientDetail: PacientCard) {
    if (!!pacientDetail)
    this.pacientDetail = {...pacientDetail};
  }

  getAllChorobaPriznaky$(): Observable<TypPriznak[]> {
    var defaultPriznak = new PriznakBuilder(-1,'');
    const keyFromParams = extractKeyFromParams(defaultPriznak);
    var response = this.priznakyCache.get(keyFromParams);
    if (response) {
      return of(response);
    }

    return this.http.get<TypPriznak[]>(this.baseUrl + `${ZDRAVOTNA_KARTA_API}/choroba/symptomy`)
    .pipe(
      map(response => {
        this.priznakyCache.set(keyFromParams, response);
        return response;
      }));
  }

  getBaleniaToMedicament$(idLiek: number): Observable<Balenie[]> {
    var defaultPriznak = new PriznakBuilder(-1,'');
    const keyFromParams = extractKeyFromParams(defaultPriznak);
    var response = this.priznakyCache.get(keyFromParams);
    if (response) {
      return of(response);
    }

    return this.http.get<Balenie[]>(this.baseUrl + `${ZDRAVOTNA_KARTA_API}/liek/${idLiek}/balenia`)
    .pipe(
      map(response => {
        this.priznakyCache.set(keyFromParams, response);
        return response;
      }));
  }

  clearPacientDetail() {
    this.pacientDetail = {} as PacientCard;
  }

  clearPriznakyCache() {
    this.priznakyCache.clear();
  }
}

  
