import { Injectable } from "@angular/core";
import { ActivatedRouteSnapshot, CanActivate, Route, Router, RouterStateSnapshot, UrlTree } from "@angular/router";
import { Observable, of } from "rxjs";

@Injectable({
    providedIn: 'root'
})
export class AuthGuard implements CanActivate {

    constructor(private router: Router) {}

    canActivate():  Observable<boolean> |  boolean {
        // tu budeme kontrolovat ci sme prihlaseny alebo nie 
        alert('Niesi prihlaseny');
        this.router.navigate(['auth']);
        return false;
    }

}