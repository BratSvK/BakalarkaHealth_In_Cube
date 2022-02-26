import { Injectable } from "@angular/core";
import { CanActivate, Router, UrlTree } from "@angular/router";
import { Store } from "@ngrx/store";
import { Observable } from "rxjs";
import { map, take } from "rxjs/operators";
import { AppState } from "../_store/models/AppState";

@Injectable({
    providedIn: 'root'
})
export class AuthGuard implements CanActivate {

    constructor(
      private router: Router,
      private store: Store<AppState>    
    ) {}

    canActivate():  Observable<boolean | UrlTree> {
        // tu budeme kontrolovat ci sme prihlaseny alebo nie 
       return this.store.select('auth').pipe(take(1),
         map((res) => {
           if (res.user) 
           {
             return true;
           }
           else {
            return this.router.parseUrl('/auth');
           }
         }),
       );
    }
}