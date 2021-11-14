import { NgModule } from "@angular/core";
import { PreloadAllModules, RouterModule, Routes } from "@angular/router";
import { NotFoundComponent } from "./errors/not-found/not-found.component";
import { ServerErrorComponent } from "./errors/server-error/server-error.component";
import { IsActivatedResolver } from "./user/patient/isActivated-resolver.service";
import { AuthGuard } from "./_guards/auth.guard";

// lazy loading for modules in our app
const appRoutes: Routes = [
    {path: '', redirectTo: '/auth', pathMatch: 'full'},
    {
        path: 'auth',
        loadChildren: () => import('./auth/auth.module').then((m) => m.AuthModule)                      
    }, 
    {   
        path:'practitioner/:id',
        canActivate: [AuthGuard],
       
        loadChildren: () => import('./user/lekar/lekar.module').then((m)=>m.LekarModule)
    },
    {
        path:'patient/:id',
        canActivate: [AuthGuard],
        resolve: [IsActivatedResolver],
        loadChildren: () => import('./user/patient/patient.module').then((m)=>m.PatientModule)
    },
    {path: 'not-found', component: NotFoundComponent},
    {path: 'server-error', component: ServerErrorComponent},
    {path: '**', component:NotFoundComponent,  pathMatch: 'full'}
];

@NgModule({
    imports: [
        // strategy -> preloadAllModules -> telling Angular in general use lazy loading but prepare other components when we need them 
         RouterModule.forRoot(appRoutes, {preloadingStrategy: PreloadAllModules, initialNavigation: 'enabled'})
    ],
    exports: [RouterModule]
})
export class AppRoutingModule {}
