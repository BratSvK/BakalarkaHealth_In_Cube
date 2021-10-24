import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { LekarComponent } from "./lekar.component";
import { ZiadankyComponent } from "./ziadanky/ziadanky.component";



const lekarRoutes: Routes = [
    { path: '', component: LekarComponent},
    { path: 'requests', component: ZiadankyComponent}

];


@NgModule({
    imports: [RouterModule.forChild(lekarRoutes)],
    exports: [RouterModule]


})
export class LekarRouting {}