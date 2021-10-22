import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { AuthGuard } from "../_guards/auth.guard";
import { AuthService } from "../_service/auth.service";
import { UserComponent } from "./user.component";


const authRoutes: Routes = [
    { path: '', component: UserComponent},
];


@NgModule({
    imports: [RouterModule.forChild(authRoutes)],
    exports: [RouterModule]


})
export class UserRouting {}