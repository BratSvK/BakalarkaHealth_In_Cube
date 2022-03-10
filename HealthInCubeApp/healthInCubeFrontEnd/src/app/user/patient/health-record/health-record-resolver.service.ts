import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { Store } from '@ngrx/store';
import { AppState } from 'src/app/_store/models/AppState';
import { switchMap, take } from 'rxjs/operators';
import { ZdravotnaKarta } from 'src/app/models/pacient/zdravotnaKarta/zdravotnaKarta';
import { HealthRecordService } from 'src/app/_service/health-record.service';
import { getPatientId } from '../store/modelStore/PatientState';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class HealthRecordResolver implements Resolve<Observable<ZdravotnaKarta>> {

  constructor(
    private zdravotnaKartaService: HealthRecordService,
    private store: Store<AppState>
  ) { }

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ZdravotnaKarta> {
    return this.store.select(getPatientId).pipe(
      take(1),
      switchMap((patientId: number) => {
        return this.zdravotnaKartaService.getHealthRecord$(patientId)
      }));
  }
  
}
