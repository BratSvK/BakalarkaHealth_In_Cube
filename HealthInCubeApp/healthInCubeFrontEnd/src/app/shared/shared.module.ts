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
import { UserDetailComponent } from '../user/user-detail/user-detail.component';
import { FormsModule } from '@angular/forms';
import { PhotoEditorComponent } from '../user/user-detail/photo-editor/photo-editor.component';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { FileUploadModule } from 'ng2-file-upload';
import { TimeagoModule } from 'ngx-timeago';
import { UserBydliskoEditorComponent } from '../user/user-detail/user-bydlisko-editor/user-bydlisko-editor.component';
import { PaginationModule } from 'ngx-bootstrap/pagination';

@NgModule({
  declarations: [
    HasRoleDirective,
    NavUserToolboxComponent,
    UserDetailComponent,
    PhotoEditorComponent,
    UserBydliskoEditorComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    BsDropdownModule.forRoot(),
    FontAwesomeModule,
    CollapseModule.forRoot(),
    InlineSVGModule.forRoot(),
    AlertModule.forRoot(),
    RouterModule,
    TabsModule.forRoot(),
    TimeagoModule.forRoot(),
    FileUploadModule,
    PaginationModule.forRoot()        // for any of angular boostrap components use forRoot 
  ],
  exports: [
    CommonModule,
    FormsModule,
    PhotoEditorComponent,
    HasRoleDirective,
    FontAwesomeModule,
    CollapseModule,
    BsDropdownModule,
    InlineSVGModule,
    NavUserToolboxComponent,
    AlertModule,
    UserDetailComponent,
    TabsModule,
    FileUploadModule,
    TimeagoModule,
    UserBydliskoEditorComponent,
    PaginationModule
  ],
})
export class SharedModule {}
