import {
  Directive,
  Input,
  OnInit,
  TemplateRef,
  ViewContainerRef,
} from '@angular/core';
import { tap } from 'rxjs/operators';
import { AtestacieVseobecnyIds } from '../models/lekar/lekar';
import { LekarService } from '../_service/lekar.service';

// vymazavanie a uakzovanie obsahu na stranke DOM
@Directive({
  selector: '[accessToGeneralPractioner]'     // check type of pracittioner true = checkGeneral
})
export class GrantToGeneralPractitionerDirective implements OnInit {
  @Input() accessToGeneralPractioner: boolean;
  lekarAtestacie: number[];

  constructor(
    private viewContianerRef: ViewContainerRef,
    private templateRef: TemplateRef<any>,
    private lekarService: LekarService
  ) {
    this.initIdsOfLekar();
  }

  ngOnInit(): void {
    if (this.lekarAtestacie?.length === 0 || this.lekarAtestacie === null) {
      this.viewContianerRef.clear();
      return;
    }
    if (this.accessToGeneralPractioner) {
      this.verificationIdsForGeneralPractitioner() ?
      this.viewContianerRef.createEmbeddedView(this.templateRef) :
      this.viewContianerRef.clear();
    } else {
      !this.verificationIdsForGeneralPractitioner() ?
      this.viewContianerRef.createEmbeddedView(this.templateRef) :
      this.viewContianerRef.clear();
    }
  }

  private verificationIdsForGeneralPractitioner(): boolean {
    if (this.lekarAtestacie === undefined){
      return false;
    }
    return this.lekarAtestacie.some((r) => AtestacieVseobecnyIds.includes(r));
  }

  private initIdsOfLekar() {
    this.lekarService.getLoginDoctorAtestations$()
      .pipe(
        tap(ids => {
          this.lekarAtestacie = ids;
        })
      )
      .subscribe();
  }
}
