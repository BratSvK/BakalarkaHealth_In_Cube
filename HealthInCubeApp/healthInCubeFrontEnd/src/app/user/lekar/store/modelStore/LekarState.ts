import { Lekar } from "src/app/models/lekar/lekar";
import { Ziadanka } from "src/app/models/ziadanka";

export interface LekarState {
    practitioner: Lekar, 
    ziadanky: Ziadanka[]
}