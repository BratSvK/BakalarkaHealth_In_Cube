import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, RouterStateSnapshot } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';
import { LekarService } from '../_service/lekar.service';

@Injectable({
  providedIn: 'root'
})
export class PractitionerHealthRecordRights implements CanActivate {

  constructor(
    private lekarService: LekarService,
    private toaster: ToastrService
    ) {}

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean>{
    return this.lekarService.checkIfDoctorIsAllowedToHealthRecord$(+route.params['idPatient']).pipe(
      tap(isAllowed => {
        if (!isAllowed)
        this.toaster.warning('Prepáčte, v tomto okamihu nemáte právo na zdravotnú kartu pacienta.')
      })
    )
  }
}
