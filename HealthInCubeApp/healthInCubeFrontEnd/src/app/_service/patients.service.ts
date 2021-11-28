import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map, switchMap } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { PacientCard } from '../models/pacientCard';
import { PaginatedResult, PAGINATION_HEADER_NAME } from '../models/pagination';

@Injectable({
  providedIn: 'root'
})
export class PatientsService {
  baseUrl = environment.apiUrl;
  pagiantedResult = new PaginatedResult<PacientCard[]>();

  idLekar: number;

  constructor(private http: HttpClient) { }

  getPatientsByDoctorId(idLekar: number, page?: number, itemsPerPage?: number) {
    let params = new HttpParams();

    if (page !== null && itemsPerPage !== null) {
      params = params.append('pageNumber', page.toString());
      params = params.append('pageSize', itemsPerPage.toString());
    }

    // observe => we get full response not body like in normal http get request !! 
    return this.http.get<PacientCard[]>(this.baseUrl + `lekar/${idLekar}/patient/list`, {observe: 'response', params})
    .pipe(
      map(response => {
        this.pagiantedResult.result = response.body;
        if (response.headers.get(PAGINATION_HEADER_NAME) !== null) {
          this.pagiantedResult.pagination = JSON.parse(response.headers.get(PAGINATION_HEADER_NAME));
        }
        return this.pagiantedResult;
      })
    )
  }



  getDoctorIdByUserId() {
    return this.http.get<number>(this.baseUrl + `lekar/id`);
  }
}
