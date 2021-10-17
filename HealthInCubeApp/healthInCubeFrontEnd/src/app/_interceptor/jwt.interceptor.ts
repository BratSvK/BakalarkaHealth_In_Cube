import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable } from 'rxjs';
import { Pouzivatel } from '../models/pouzivatel';
import { AppState } from '../_store/models/AppState';
import { Store } from '@ngrx/store';
import { take } from 'rxjs/operators';
import { UserToLogin } from '../models/userToLogin';



// we are storing cuurent user a token 
@Injectable()
export class JwtInterceptor implements HttpInterceptor {

  constructor(private store: Store<AppState>) {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {

    let currentUser: Pouzivatel;

    // tu ho nacitam zo storu take(1) and subscbribe -> we dont need to unsubscrube and we are complete 
    // ak prejdeme chceme naklonovat spravit deep copy a vlozit nove daata ako autorizacia 
    this.store.select('auth').pipe(take(1)).subscribe(userData => {
        var user: UserToLogin = userData.user;
         currentUser = new Pouzivatel(user.email,user.userId,user.fullName, user.fotka, user.token, user.expirationDateToken, user.roleStoreBase);
    });


    if (currentUser) {
      request = request.clone({
        setHeaders: {
          Authorization: `Bearer ${currentUser.token}`        // pridas nas token vzdy ked sa prihlasime 
        }
      })
    }




    return next.handle(request);
  }
}
