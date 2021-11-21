import { Bydlisko } from "src/app/models/bydlisko";
import { PouzivatelDetail } from "src/app/models/pouzivatel-detail";

export interface UserDetailState {
    userDetail: PouzivatelDetail,
    bydliska: Bydlisko[],
    editedBydlisko: Bydlisko,
    editedBydliskoIndex: number
}