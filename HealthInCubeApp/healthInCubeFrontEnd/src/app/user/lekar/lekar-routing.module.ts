import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { LekarStateGuard } from "src/app/_guards/lekar-state.guard";
import { CalendarComponent } from "../calendar/calendar.component";
import { UserDetailResolver } from "../user-detail/user-detail-resolver.service";
import { UserDetailComponent } from "../user-detail/user-detail.component";
import { LekarComponent } from "./lekar.component";
import { PacientiListComponent } from "./pacienti-list/pacienti-list.component";
import { VysetreniaComponent } from "./vysetrenia/vysetrenia.component";
import { ZiadankyResolverService } from "./ziadanky/ziadanky-resolver.service";
import { ZiadankyComponent } from "./ziadanky/ziadanky.component";

const lekarRoutes: Routes = [
    { path: '', 
       canActivate: [LekarStateGuard],
       component: LekarComponent,
    children: [
        { path: '' , pathMatch: 'full', redirectTo: 'vysetrenia'},
        // { path: 'pacienti-list', resolve: {patients$: PatientListResolver}, component: PacientiListComponent},
        { path: 'pacienti-list', component: PacientiListComponent},
        { path: 'requests', component: ZiadankyComponent, resolve: [ZiadankyResolverService]},
        { path: 'vysetrenia',  component: VysetreniaComponent},
        { path: 'edit', resolve: [UserDetailResolver], component: UserDetailComponent},
        { path: 'calendar',  component: CalendarComponent},
    ]},
]

@NgModule({
    imports: [RouterModule.forChild(lekarRoutes)],
    exports: [RouterModule]
})
export class LekarRoutingModule {}