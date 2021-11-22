import { Bydlisko } from "src/app/models/bydlisko";
import { Mesto } from "src/app/models/mesto";
import { PouzivatelDetail } from "src/app/models/pouzivatel-detail";

export interface UserDetailState {
    userDetail: PouzivatelDetail,
    bydliska: Bydlisko[],
    editedBydlisko: Bydlisko,
    editedBydliskoIndex: number,
    mesta: Mesto[]
}