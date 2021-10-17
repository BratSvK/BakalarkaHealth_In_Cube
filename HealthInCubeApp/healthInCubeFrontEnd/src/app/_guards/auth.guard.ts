import { Injectable } from "@angular/core";
import { ActivatedRouteSnapshot, CanActivate, Route, Router, RouterStateSnapshot, UrlTree } from "@angular/router";
import { Store } from "@ngrx/store";
import { relativeTimeThreshold } from "moment";
import { ToastrService } from "ngx-toastr";
import { Observable, of } from "rxjs";
import { map, take } from "rxjs/operators";
import { AppState } from "../_store/models/AppState";

@Injectable({
    providedIn: 'root'
})
export class AuthGuard implements CanActivate {

    constructor(private router: Router, private store: Store<AppState>, private toastr: ToastrService) {}

    canActivate():  Observable<boolean> {
        // tu budeme kontrolovat ci sme prihlaseny alebo nie 

       return this.store.select('auth').pipe(take(1),
         map((res) => {
           if (res.user) return true;
           this.toastr.error('You need to log in');
           this.router.navigate(['/auth']);
           return false;
         })
       );
    }

}