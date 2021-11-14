// bude obsahovat vsetky moduly co su zdielatelne a potrebne pre kazdy komponent 

import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { BsDropdownModule } from "ngx-bootstrap/dropdown";
import { HasRoleDirective } from "../_directives/has-role.directive";
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { CollapseModule } from 'ngx-bootstrap/collapse';
import { InlineSVGModule } from "ng-inline-svg";
import { NavUserToolboxComponent } from "../nav/nav-user-toolbox/nav-user-toolbox.component";
import { AlertModule } from "ngx-bootstrap/alert";
import { RouterModule } from "@angular/router";

@NgModule({
  declarations: [HasRoleDirective, NavUserToolboxComponent],
  imports: [CommonModule, BsDropdownModule.forRoot(), FontAwesomeModule,CollapseModule.forRoot(),InlineSVGModule.forRoot(), AlertModule.forRoot(), RouterModule],
  exports: [CommonModule, HasRoleDirective,FontAwesomeModule, CollapseModule, BsDropdownModule, InlineSVGModule, NavUserToolboxComponent, AlertModule]
})
export class SharedModule {}