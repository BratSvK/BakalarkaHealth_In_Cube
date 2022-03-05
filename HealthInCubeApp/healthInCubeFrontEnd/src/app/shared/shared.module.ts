// bude obsahovat vsetky moduly co su zdielatelne a potrebne pre kazdy komponent
import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { HasRoleDirective } from '../_directives/has-role.directive';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { CollapseModule } from 'ngx-bootstrap/collapse';
import { InlineSVGModule } from 'ng-inline-svg';
import { NavUserToolboxComponent } from '../nav/nav-user-toolbox/nav-user-toolbox.component';
import { AlertModule } from 'ngx-bootstrap/alert';
import { RouterModule } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { FileUploadModule } from 'ng2-file-upload';
import { TimeagoModule } from 'ngx-timeago';
import { PaginationModule } from 'ngx-bootstrap/pagination';
import { ModalModule } from 'ngx-bootstrap/modal';
import { TooltipModule } from 'ngx-bootstrap/tooltip';
import { BsDatepickerModule } from 'ngx-bootstrap/datepicker';
import { HasFocusDirective } from '../_directives/has-focus.directive';
import { TimepickerModule } from 'ngx-bootstrap/timepicker';

@NgModule({
  declarations: [
    HasRoleDirective,
    HasFocusDirective,
    NavUserToolboxComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    BsDatepickerModule.forRoot(),
    ReactiveFormsModule,
    BsDropdownModule.forRoot(),
    FontAwesomeModule,
    CollapseModule.forRoot(),
    InlineSVGModule.forRoot(),
    AlertModule.forRoot(),
    RouterModule,
    TabsModule.forRoot(),
    TimeagoModule.forRoot(),
    FileUploadModule,
    PaginationModule.forRoot(),        // for any of angular boostrap components use forRoot 
    ModalModule.forRoot(),
    TooltipModule.forRoot(),
    TimepickerModule.forRoot()
  ],
  exports: [
    CommonModule,
    FormsModule,
    TooltipModule,
    BsDatepickerModule,
    HasRoleDirective,
    HasFocusDirective,
    FontAwesomeModule,
    CollapseModule,
    BsDropdownModule,
    InlineSVGModule,
    NavUserToolboxComponent,
    AlertModule,
    TabsModule,
    FileUploadModule,
    TimeagoModule,
    PaginationModule,
    ModalModule,
    ReactiveFormsModule,
    TimepickerModule
  ]
})
export class SharedModule {}
