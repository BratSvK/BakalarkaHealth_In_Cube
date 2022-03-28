import { HTTP_INTERCEPTORS } from "@angular/common/http";
import { LOCALE_ID, NgModule } from "@angular/core";
import { ErrorInterceptor } from "./_interceptor/error.interceptor";
import { JwtInterceptor } from "./_interceptor/jwt.interceptor";
import { LoadingInterceptor } from "./_interceptor/loading.interceptor";

// moodule for providers -> interceptors 
@NgModule({
    providers: [
        // {provide: HTTP_INTERCEPTORS,  useClass: AuthInterceptorService, multi: true}
         {provide: HTTP_INTERCEPTORS,  useClass: JwtInterceptor, multi: true},
         {provide: HTTP_INTERCEPTORS,  useClass: LoadingInterceptor, multi: true},
         {provide: HTTP_INTERCEPTORS,  useClass: ErrorInterceptor, multi: true},
         {provide: LOCALE_ID, useValue: "sk"}
    ]
})
export class CoreModule {}