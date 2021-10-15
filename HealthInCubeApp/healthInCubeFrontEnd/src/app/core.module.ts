import { HTTP_INTERCEPTORS } from "@angular/common/http";
import { NgModule } from "@angular/core";
import { JwtInterceptor } from "./_interceptor/jwt.interceptor";

// moodule for providers -> interceptors 
@NgModule({
    providers: [
        // {provide: HTTP_INTERCEPTORS,  useClass: AuthInterceptorService, multi: true}
         {provide: HTTP_INTERCEPTORS,  useClass: JwtInterceptor, multi: true}

    ]
})
export class CoreModule {}