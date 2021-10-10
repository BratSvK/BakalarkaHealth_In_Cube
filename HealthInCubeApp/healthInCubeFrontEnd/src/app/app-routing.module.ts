import { NgModule } from "@angular/core";
import { PreloadAllModules, RouterModule, Routes } from "@angular/router";



// tu budu nase routes v aplikacii-> najlepsie pouzit lazy loading a AuthGuard pre admina -> a pouzivatela 
const appRoutes: Routes = [
    // PRIKLAD AKO TO POUZIT
    // { path: '', redirectTo: '/recipes', pathMatch: 'full' },
    // {
    //     path: 'recipes',
    //     loadChildren: () =>
    //       import('./recipes/recipes.module').then((m) => m.RecipesModule),
    //   }, // lazy loading -> please only laod module when user visits this path only;

    {path: '', redirectTo: '/auth', pathMatch: 'full'},
    {
        path: 'auth',
        loadChildren: () => import('./auth/auth.module').then((m) => m.AuthModule)      // lazy loading, nedaveme to do appModule
    }
];




@NgModule({
    imports: [
        // strategy -> preloadAllModules -> telling Angular in general use lazy loading but prepare other components when we need them 
         RouterModule.forRoot(appRoutes, {preloadingStrategy: PreloadAllModules, initialNavigation: 'enabled'})
       

    ],
    exports: [RouterModule]
})
export class AppRoutingModule {}



