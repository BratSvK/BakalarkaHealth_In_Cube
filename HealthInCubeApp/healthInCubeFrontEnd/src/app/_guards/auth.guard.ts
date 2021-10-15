import { Injectable } from "@angular/core";
import { ActivatedRouteSnapshot, CanActivate, RouterStateSnapshot, UrlTree } from "@angular/router";
import { Observable, of } from "rxjs";

@Injectable({
    providedIn: 'root'
})
export class AuthGuard implements CanActivate {

    constructor() {}

    canActivate():  Observable<boolean> {
        // tu budeme kontrolovat ci sme prihlaseny alebo nie 
        return of();


    }

}