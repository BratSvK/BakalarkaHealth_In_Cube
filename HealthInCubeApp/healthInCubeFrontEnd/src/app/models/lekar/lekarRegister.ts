import { RegisterPouzivatel } from "../pouzivatelRegistracia";
import { PracovnaDoba } from "../pracovnaDoba/pracovnaDoba";
import { AtestaciaLekar } from "./atestacia/atestaciaLekar";

export interface LekarRegister extends RegisterPouzivatel {
    idOddel: number;
    dlzkaVysetrenia: number;
    pracovnaDobas: PracovnaDoba[];
    atestacieLekars: AtestaciaLekar[];
}