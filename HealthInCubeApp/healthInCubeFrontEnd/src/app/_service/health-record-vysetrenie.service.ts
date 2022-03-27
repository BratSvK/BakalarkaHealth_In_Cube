import { HttpClient } from '@angular/common/http';
import { EventEmitter, Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { Observable, of } from 'rxjs';
import { catchError, map, take, tap } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { PacientCard } from '../models/pacient/pacientCard';
import { VykVysetrenie } from '../models/pacient/zdravotnaKarta/vykovaneVysetrenia/vykonaneVysetrenia';
import { VysetrenieVysledok } from '../models/pacient/zdravotnaKarta/vykovaneVysetrenia/vysetrenieCreate';
import { Balenie, BalenieBuilder } from '../models/pacient/zdravotnaKarta/zapChoroby/liek/balenie/balenie';
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


  constructor(
    private http: HttpClient) {
  }

  createVysetrenie$(vysetrenieCreate: VysetrenieVysledok) {
    return this.http.post<VykVysetrenie>(this.baseUrl + `${ZDRAVOTNA_KARTA_API}/${vysetrenieCreate.idPacient}/vysetrenie`, vysetrenieCreate);
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
    var defaultBalenie = new BalenieBuilder('FFFFF',-1);
    const keyFromParams = extractKeyFromParams(defaultBalenie);
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

  
