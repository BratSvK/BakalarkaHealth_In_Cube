import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppRoutingModule } from './app-routing.module';
import { CoreModule } from './core.module';
import { StoreModule } from '@ngrx/store';
import { appReducer } from './_store/app.reducer';
import { EffectsModule } from '@ngrx/effects';
import { StoreDevtoolsModule } from '@ngrx/store-devtools';
import { environment } from 'src/environments/environment';
import { RegisterEffects } from './auth/register/store/register.effects';
import { HttpClientModule } from '@angular/common/http';
import { AuthEffects } from './auth/store/auth.effects';
import {ToastrModule} from 'ngx-toastr';
import { PatientEffects } from './user/patient/store/patient.effects';
import { LekarEffects } from './user/lekar/store/lekar.effects';
import { NgxSpinnerModule } from 'ngx-spinner';
import { NotFoundComponent } from './errors/not-found/not-found.component';
import { ServerErrorComponent } from './errors/server-error/server-error.component';
import { AlertModule } from 'ngx-bootstrap/alert';
import { UserDetailEffects } from './user/user-detail/store/user-detail.effects';
import { PaginationModule } from 'ngx-bootstrap/pagination';
import { TimepickerModule } from 'ngx-bootstrap/timepicker';


@NgModule({
  declarations: [
    AppComponent,
    NotFoundComponent,
    ServerErrorComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    HttpClientModule,
    NgxSpinnerModule,
    CoreModule,
    ToastrModule.forRoot({      // config options 
      positionClass: 'toast-bottom-right'
    }),
    StoreModule.forRoot(appReducer),
    EffectsModule.forRoot([RegisterEffects, AuthEffects, PatientEffects, LekarEffects, UserDetailEffects]),
    StoreDevtoolsModule.instrument({logOnly: environment.production}),
    AlertModule.forRoot(),
    PaginationModule.forRoot(),
    TimepickerModule.forRoot(),
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
