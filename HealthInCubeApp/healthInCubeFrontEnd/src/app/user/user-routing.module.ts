import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { UserComponent } from "./user.component";


const authRoutes: Routes = [
    { path: '', component: UserComponent},
    {
        path:'practitioner',
        
        loadChildren: () => import('./lekar/lekar.module').then((m)=>m.LekarModule)
    }

];


@NgModule({
    imports: [RouterModule.forChild(authRoutes)],
    exports: [RouterModule]


})
export class UserRouting {}