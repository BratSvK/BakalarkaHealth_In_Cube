import { Injectable } from "@angular/core";
import { ActivatedRouteSnapshot, CanActivate, Route, Router, RouterStateSnapshot, UrlTree } from "@angular/router";
import { Store } from "@ngrx/store";
import { relativeTimeThreshold } from "moment";
import { ToastrService } from "ngx-toastr";
import { Observable, of } from "rxjs";
import { map, take } from "rxjs/operators";
import { Url } from "url";
import { AppState } from "../_store/models/AppState";

@Injectable({
    providedIn: 'root'
})
export class AuthGuard implements CanActivate {

    constructor(private router: Router, private store: Store<AppState>, private toastr: ToastrService) {}

    canActivate():  Observable<boolean | UrlTree> {
        // tu budeme kontrolovat ci sme prihlaseny alebo nie 

       return this.store.select('auth').pipe(take(1),
         map((res) => {
           if (res.user) 
           {
             return true;
           }
           else {
            this.toastr.error('You need to log in');
            return this.router.parseUrl('/auth');
           }
         }),
        
       );
    }

}