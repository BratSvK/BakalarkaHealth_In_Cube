import {
  Directive,
  Input,
  OnInit,
  TemplateRef,
  ViewContainerRef,
} from '@angular/core';
import { Store } from '@ngrx/store';
import { map, take } from 'rxjs/operators';
import { Pouzivatel } from '../models/pouzivatel';
import { AppState } from '../_store/models/AppState';

// vymazavanie a uakzovanie obsahu na stranke DOM
@Directive({
  selector: '[appUserHasRole]', // *appUserHasRole["Pacient"]/["Lekar"]
})
export class HasRoleDirective implements OnInit {
  @Input() appUserHasRole: string[];
  user: Pouzivatel;

  constructor(
    private viewContianerRef: ViewContainerRef,
    private templateRef: TemplateRef<any>,
    private store: Store<AppState>
  ) {
    // nacitam usera prihlaseneho aktualne co je
    // complete and auto sub
    this.store.select('auth').pipe(take(1),
    map(authData => {
      return authData.user;
    })
    ).subscribe(authUser =>{
      	this.user = authUser
    });
  }

  ngOnInit(): void {
    // clear view if no roles
    if (!this.user?.roleStoreBase || this.user == null) {
      this.viewContianerRef.clear();
      return;
    }

    

    if (this.user?.roleStoreBase.some((r) => this.appUserHasRole.includes(r))) {
      this.viewContianerRef.createEmbeddedView(this.templateRef);
    } else {
      this.viewContianerRef.clear();
    }
  }
}
