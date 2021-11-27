import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { PacientCard } from '../models/pacientCard';

@Injectable({
  providedIn: 'root'
})
export class PatientsService {
  baseUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getPatientsByDoctorId(doctorId: number) {
    return this.http.get<PacientCard[]>(this.baseUrl + `lekar/${doctorId}/patient/list`);
  }


  getDoctorIdByUserId() {
    return this.http.get<number>(this.baseUrl + `lekar/id`)
  }

}
