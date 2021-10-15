import {
  Directive,
  Input,
  OnInit,
  TemplateRef,
  ViewContainerRef,
} from '@angular/core';
import { Pouzivatel } from '../models/pouzivatel';

// vymazavanie a uakzovanie obsahu na stranke DOM
@Directive({
  selector: '[appUserHasRole]', // *appUserHasRole["Pacient"]/["Lekar"]
})
export class HasRoleDirective implements OnInit {
  @Input() appUserHasRole: string[];
  user: Pouzivatel;

  constructor(
    private viewContianerRef: ViewContainerRef,
    private templateRef: TemplateRef<any>
  ) {
    // nacitam usera prihlaseneho aktualne co je
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
