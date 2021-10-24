import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { LekarComponent } from "./lekar.component";
import { PacientiListComponent } from "./pacienti-list/pacienti-list.component";
import { VysetreniaComponent } from "./vysetrenia/vysetrenia.component";
import { ZiadankyComponent } from "./ziadanky/ziadanky.component";



const lekarRoutes: Routes = [
    { path: '', component: LekarComponent},
    { path: 'requests',  component: ZiadankyComponent},
    { path: 'pacienti-list',  component: PacientiListComponent},
    { path: 'vysetrenia',  component: VysetreniaComponent}
];


@NgModule({
    imports: [RouterModule.forChild(lekarRoutes)],
    exports: [RouterModule]


})
export class LekarRouting {}