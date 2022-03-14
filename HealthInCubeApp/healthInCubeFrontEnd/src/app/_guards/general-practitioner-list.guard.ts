import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot } from '@angular/router';
import { ConsoleLogger } from '@microsoft/signalr/dist/esm/Utils';
import { map } from 'rxjs/operators';
import { LekarService } from '../_service/lekar.service';

@Injectable({
  providedIn: 'root'
})
export class GeneralPractitionerListGuard implements CanActivate {

  constructor(
    private router: Router,
    private lekarService: LekarService
    ) {}

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot){
    return this.lekarService.getLoginDoctorAtestations$().pipe(
      map((atestacie: number[]) => {
        if (this.isGeneralPractitioner(atestacie)){
          return true;
        } else {
          const nextLinkToRedirect = state.url.replace('pacienti-list','vysetrenia');
          this.router.navigate([nextLinkToRedirect]);
          return false;
        }
      }));
  }


  private isGeneralPractitioner(atestacie: number[]) : boolean {
    return atestacie.some(a => a === 65 || a === 66);
  }
}
