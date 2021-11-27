import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import { Pouzivatel } from '../models/pouzivatel';
import { AppState } from '../_store/models/AppState';
import { map, take } from 'rxjs/operators';

@Injectable()
export class JwtTokenInterceptor implements HttpInterceptor {

  // we wanna currentUser -> observable 
  constructor(private store: Store<AppState>) {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    let currentUser: Pouzivatel;

    // do we need unsubcribe ? 
    // using pipe and take(1) -> we wanna complete after taking one user and no subscribe anymore
    this.store.select('auth').pipe(
      take(1),
      map(authData => {
        return authData.user
      }))
      .subscribe( user => currentUser = user);

    // to touch every token when we loggin and save it to the token
    if (currentUser ){
      request = request.clone({
        setHeaders: {
          Authorization: `Bearer ${currentUser.token}`
        }
      })
    }
    return next.handle(request);
  }
}
