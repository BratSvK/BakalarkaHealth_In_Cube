import { NgModule } from "@angular/core";
import { SharedModule } from "src/app/shared/shared.module";
import { LekarRouting } from "./lekar-routing.module";
import { ZiadankyComponent } from "./ziadanky/ziadanky.component";
import { PacientiListComponent } from './pacienti-list/pacienti-list.component';
import { VysetreniaComponent } from './vysetrenia/vysetrenia.component';

@NgModule({
    declarations: [ZiadankyComponent, PacientiListComponent, VysetreniaComponent],
    imports: [SharedModule, LekarRouting],
  })
  export class LekarModule {}
  