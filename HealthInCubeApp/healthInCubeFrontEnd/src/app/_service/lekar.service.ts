import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable, of } from 'rxjs';
import { delay, filter, map, take, tap } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { LekarSprievodka } from '../models/lekar/lekarSprievodka';
import { LekarTyp } from '../models/lekar/typLekar';
import { notNull, notUndefined } from '../shared/common';
import { getPractitionerAtestationsId, getPractitionerIsActivatedAccount, getPractitionorIdState } from '../user/lekar/store/modelStore/LekarState';
import { LEKAR_API } from '../_constants/endPointsApi';
import { AppState } from '../_store/models/AppState';


@Injectable({
  providedIn: 'root'
})
export class LekarService {
  baseUrl = environment.apiUrl;
  typeOfLekarCache = new Map();

  constructor(
    private http: HttpClient,
    private store: Store<AppState>
  ) { }

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

  getLoginDoctorAtestations$(): Observable<number[]> {
    return this.store.select(getPractitionerAtestationsId).pipe(
      filter(notUndefined),
      take(1)
    );;
  }

  getLoginDoctorId$(): Observable<number> {
    return this.store.select(getPractitionorIdState).pipe(
      filter(notUndefined),
      take(1)
    );
  }

  checkIsActivetedDoctorAccountApi$(): Observable<boolean> {
    return this.http.get<boolean>(this.baseUrl + `${LEKAR_API}/activated`);
  }

  checkIsActivetedDoctorAccount$() : Observable<boolean> {
    return this.store.select(getPractitionerIsActivatedAccount).pipe(
      filter(notUndefined),
      take(1)
    );
  }

  getDoctorsByType(idTyp: number): Observable<LekarSprievodka[]> {
    return this.http.get<LekarSprievodka[]>(this.baseUrl + `${LEKAR_API}/all/${idTyp}`)
  }
}
