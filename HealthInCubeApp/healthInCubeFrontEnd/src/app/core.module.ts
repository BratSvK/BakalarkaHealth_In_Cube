import { NgModule } from "@angular/core";

// moodule for providers -> interceptors 
@NgModule({
    providers: [
        // {provide: HTTP_INTERCEPTORS,  useClass: AuthInterceptorService, multi: true}
    ]
})
export class CoreModule {}