// bude obsahovat vsetky moduly co su zdielatelne a potrebne pre kazdy komponent 

import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";

@NgModule({
    declarations: [],
    imports: [CommonModule],
    exports: [CommonModule]
})
export class SharedModule {}