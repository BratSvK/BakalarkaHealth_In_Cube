import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable } from 'rxjs';
import { Pouzivatel } from '../models/pouzivatel';



// we are storing cuurent user a token 
@Injectable()
export class JwtInterceptor implements HttpInterceptor {

  constructor() {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {

    let currentUser: Pouzivatel;

    // tu ho nacitam zo storu take(1) and subscbribe -> we dont need to unsubscrube and we are complete 
    // ak prejdeme chceme naklonovat spravit deep copy a vlozit nove daata ako autorizacia 
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
