import { Mesto } from "src/app/models/mesto";
import { Okres } from "src/app/models/okres";
import { Lekar } from "src/app/models/lekar";
import { Rola } from "src/app/models/rola";

export interface RegisterState {
    mesta: Mesto[];
    okresy: Okres[];
    practitioners: Lekar[]

}