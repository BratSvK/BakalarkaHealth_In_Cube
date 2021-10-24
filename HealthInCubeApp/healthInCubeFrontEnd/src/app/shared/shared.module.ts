// bude obsahovat vsetky moduly co su zdielatelne a potrebne pre kazdy komponent 

import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { BsDropdownModule } from "ngx-bootstrap/dropdown";
import { NavComponent } from "../nav/nav.component";
import { HasRoleDirective } from "../_directives/has-role.directive";
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { CollapseModule } from 'ngx-bootstrap/collapse';

@NgModule({
  declarations: [NavComponent, HasRoleDirective,],
  imports: [CommonModule,    BsDropdownModule.forRoot(), FontAwesomeModule,CollapseModule.forRoot()],
  exports: [CommonModule, NavComponent, HasRoleDirective,FontAwesomeModule]
})
export class SharedModule {}