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




@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    HttpClientModule,
    CoreModule, 
    ToastrModule.forRoot({      // config options 
      positionClass: 'toast-bottom-right'
    }),
    StoreModule.forRoot(appReducer),
    EffectsModule.forRoot([RegisterEffects, AuthEffects]),
    StoreDevtoolsModule.instrument({logOnly: environment.production})
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
