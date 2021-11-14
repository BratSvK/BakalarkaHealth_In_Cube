import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { LekarComponent } from "./lekar.component";
import { PacientiListComponent } from "./pacienti-list/pacienti-list.component";
import { VysetreniaComponent } from "./vysetrenia/vysetrenia.component";
import { ZiadankyResolverService } from "./ziadanky/ziadanky-resolver.service";
import { ZiadankyComponent } from "./ziadanky/ziadanky.component";



const lekarRoutes: Routes = [
    { path: '', component: LekarComponent,
    children: [
        { path: '' , pathMatch: 'full', redirectTo: 'pacienti-list'},
        { path: 'pacienti-list',  component: PacientiListComponent},
        { path: 'requests', component: ZiadankyComponent, resolve: [ZiadankyResolverService]},
        { path: 'vysetrenia',  component: VysetreniaComponent}
    ]},

]

@NgModule({
    imports: [RouterModule.forChild(lekarRoutes)],
    exports: [RouterModule]
})
export class LekarRoutingModule {}