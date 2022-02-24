import { RegisterPouzivatel } from "../pouzivatelRegistracia";
import { PracovnaDoba } from "../pracovnaDoba/pracovnaDoba";
import { AtestaciaLekar } from "./atestacia/atestaciaLekar";

export interface LekarRegister extends RegisterPouzivatel {
    idNemocnica: number;
    idOddelenie: number;
    dlzkaVysetrenia: number;
    pracovnaDobas: PracovnaDoba[];
    atestacieLekars: AtestaciaLekar[];
}
