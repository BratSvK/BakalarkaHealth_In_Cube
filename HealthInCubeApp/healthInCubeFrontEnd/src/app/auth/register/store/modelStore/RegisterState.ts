import { Mesto } from "src/app/models/mesto";
import { Okres } from "src/app/models/okres";
import { Rola } from "src/app/models/rola";

export interface RegisterState {
    mesta: Mesto[];
    okresy: Okres[];
    role: Rola[];

}