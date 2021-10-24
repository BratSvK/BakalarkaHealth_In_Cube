import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { ZiadankyComponent } from "./lekar/ziadanky/ziadanky.component";
import { UserComponent } from "./user.component";


const authRoutes: Routes = [
    { path: '', component: UserComponent,
    
    children: [
        {
            path:'practitioner',
            loadChildren: () => import('./lekar/lekar.module').then((m)=>m.LekarModule)
        },
        {
            path:'patient',
            loadChildren: () => import('./patient/patient.module').then((m)=>m.PatientModule)
        }

    ]},
    

];


@NgModule({
    imports: [RouterModule.forChild(authRoutes)],
    exports: [RouterModule]


})
export class UserRouting {}