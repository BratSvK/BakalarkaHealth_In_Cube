import { Liek } from "./liek";
import { LiekUcinnaLatka } from "./ucinnaLatka/liekUcinnaLatka";

export interface LiekRecep extends Liek {
    liekUcinnaLatkas: LiekUcinnaLatka[];
}