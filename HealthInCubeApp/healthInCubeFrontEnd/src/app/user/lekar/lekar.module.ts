import { NgModule } from "@angular/core";
import { SharedModule } from "src/app/shared/shared.module";
import { LekarRoutingModule } from "./lekar-routing.module";
import { ZiadankyComponent } from "./ziadanky/ziadanky.component";
import { PacientiListComponent } from './pacienti-list/pacienti-list.component';
import { VysetreniaComponent } from './vysetrenia/vysetrenia.component';
import { NavLekarComponent } from "../../nav/nav-lekar/nav-lekar.component";
import { LekarComponent } from "./lekar.component";
import { PacientCardComponent } from './pacienti-list/pacient-card/pacient-card.component';
import { SprievodkaModalComponent } from './sprievodka/sprievodka-modal/sprievodka-modal.component';
import { UserDetailModule } from "../user-detail/user-detail.module";
import { GrantToGeneralPractitionerDirective } from "src/app/_directives/grant-to-general-practitioner.directive";

@NgModule({
    declarations: [   
        NavLekarComponent, 
        LekarComponent,
        ZiadankyComponent, 
        PacientiListComponent, 
        VysetreniaComponent, 
        PacientCardComponent, 
        SprievodkaModalComponent,
        GrantToGeneralPractitionerDirective
    ],
    imports: [
        SharedModule, 
        LekarRoutingModule,
        UserDetailModule
    ]
   })
  export class LekarModule {}
  