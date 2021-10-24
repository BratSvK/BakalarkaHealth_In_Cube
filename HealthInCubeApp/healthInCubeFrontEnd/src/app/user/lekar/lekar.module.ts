import { NgModule } from "@angular/core";
import { SharedModule } from "src/app/shared/shared.module";
import { LekarRouting } from "./lekar-routing.module";
import { ZiadankyComponent } from "./ziadanky/ziadanky.component";

@NgModule({
    declarations: [ZiadankyComponent],
    imports: [SharedModule, LekarRouting],
  })
  export class LekarModule {}
  