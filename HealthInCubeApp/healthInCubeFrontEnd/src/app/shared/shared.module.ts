// bude obsahovat vsetky moduly co su zdielatelne a potrebne pre kazdy komponent 

import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { BsDropdownModule } from "ngx-bootstrap/dropdown";
import { HasRoleDirective } from "../_directives/has-role.directive";
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { CollapseModule } from 'ngx-bootstrap/collapse';
import { InlineSVGModule } from "ng-inline-svg";

@NgModule({
  declarations: [HasRoleDirective],
  imports: [CommonModule, BsDropdownModule.forRoot(), FontAwesomeModule,CollapseModule.forRoot(),InlineSVGModule.forRoot()],
  exports: [CommonModule, HasRoleDirective,FontAwesomeModule, CollapseModule, BsDropdownModule, InlineSVGModule]
})
export class SharedModule {}