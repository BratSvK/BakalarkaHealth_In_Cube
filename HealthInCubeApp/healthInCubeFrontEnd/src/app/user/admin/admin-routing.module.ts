import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { AdminComponent } from "./admin.component";
import { DoctorRequestsComponent } from "./doctor-requests/doctor-requests.component";

const adminRoutes: Routes = [
    { path: '', 
       component: AdminComponent,
    children: [
        { path: '' , pathMatch: 'full', redirectTo: 'ziadanky-lekar'},
        { path: 'ziadanky-lekar', component: DoctorRequestsComponent},
    ]},
]

@NgModule({
    imports: [RouterModule.forChild(adminRoutes)],
    exports: [RouterModule]
})
export class AdminRoutingModule {}