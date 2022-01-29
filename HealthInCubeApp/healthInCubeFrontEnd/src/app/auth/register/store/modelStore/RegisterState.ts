import { Mesto } from "src/app/models/mesto";
import { Okres } from "src/app/models/okres";
import { Lekar } from "src/app/models/lekar/lekar";

export interface RegisterState {
    mesta: Mesto[];
    okresy: Okres[];
    mestaBirth: Mesto[];
    okresyBirth: Okres[];
    practitioners: Lekar[]
}