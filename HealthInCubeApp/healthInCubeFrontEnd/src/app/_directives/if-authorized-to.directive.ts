import { Directive, Input, TemplateRef, ViewContainerRef } from '@angular/core';
import { Router } from '@angular/router';
import { getTypeOfAccount } from '../shared/common';



@Directive({
  selector: '[ifAuthorizedTo]'
})
export class IfAuthorizedToDirective {
  @Input('ifAuthorizedTo') accountTypeAllowedToAction: string;

  constructor(
    private templateRef: TemplateRef<any>,
    private viewContianerRef: ViewContainerRef,
    private router: Router
    ) {}

  ngOnInit(): void {
    if (this.hasMissingParams()) {
      this.viewContianerRef.createEmbeddedView(this.templateRef);
    } else {
      const hasAccessGranted = this.accessGranted();
      if (hasAccessGranted) {
        this.viewContianerRef.createEmbeddedView(this.templateRef);
      } else {
        this.viewContianerRef.clear();
      }
    }

    
    // if (!this.user?.roleStoreBase || this.user == null) {
    //   
    // }

    

    // if (this.user?.roleStoreBase.some((r) => this.appUserHasRole.includes(r))) {
    //   this.viewContianerRef.createEmbeddedView(this.templateRef);
    // } else {
    //   this.viewContianerRef.clear();
    // }
  }

  private accessGranted() : boolean {
    return this.accountTypeAllowedToAction === getTypeOfAccount(this.router);
  }
  

  private hasMissingParams() : boolean {
    return this.accountTypeAllowedToAction.length === 0;
  }

  
}
