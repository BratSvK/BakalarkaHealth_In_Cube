import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { LekarParams } from '../models/lekarParams';
import { PacientCard } from '../models/pacientCard';
import { PaginatedResult, PAGINATION_HEADER_NAME } from '../models/pagination';
import { AppState } from '../_store/models/AppState';

@Injectable({
  providedIn: 'root',
})
export class PatientService {
  baseUrl = environment.apiUrl;
  idLekar: number;

  constructor(private http: HttpClient, private store: Store<AppState>) {}

  getPatientsByDoctorId(idLekar: number, lekarParams: LekarParams) {
    let apiUrl = this.baseUrl + `lekar/${idLekar}/patient/list`;
    let params = this.getPaginationHeaders(
      lekarParams.pageNumber,
      lekarParams.pageSize
    );

    params = params.append('ageFrom', lekarParams.ageFrom.toString());
    params = params.append('ageTo', lekarParams.ageTo.toString());

    if (lekarParams.lastName) {
      params = params.append('lastName', lekarParams.lastName.toString());
    }
    if (lekarParams.bid) {
      params = params.append('bid', lekarParams.bid.toString());
    }

    // observe => we get full response not body like in normal http get request !!
    return this.getPaginatedResult<PacientCard[]>(apiUrl, params);
  }

  getDoctorIdByUserId() {
    return this.http.get<number>(this.baseUrl + `lekar/id`);
  }


  checkIsActiveted$() : Observable<boolean> {
    return this.store.select('patient').pipe(map(patientData => {
      return patientData.isActivated
    }));
  } 
  /*
      Generic method for getting paginated result from api.
  */
  private getPaginatedResult<T>(url: string, params: HttpParams) {
    const pagiantedResult = new PaginatedResult<T>();
    return this.http
      .get<T>(url, {
        observe: 'response',
        params,
      })
      .pipe(
        map((response) => {
          pagiantedResult.result = response.body;
          if (response.headers.get(PAGINATION_HEADER_NAME) !== null) {
            pagiantedResult.pagination = JSON.parse(
              response.headers.get(PAGINATION_HEADER_NAME)
            );
          }
          return pagiantedResult;
        })
      );
  }

  private getPaginationHeaders(pageNumber: number, pageSize: number) {
    let params = new HttpParams();

    params = params.append('pageNumber', pageNumber.toString());
    params = params.append('pageSize', pageSize.toString());

    return params;
  }
}
