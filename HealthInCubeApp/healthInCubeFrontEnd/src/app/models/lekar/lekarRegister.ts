import { RegisterPouzivatel } from "../pouzivatelRegistracia";
import { PracovnaDoba } from "../pracovnaDoba/pracovnaDoba";

export interface LekarRegister extends RegisterPouzivatel {
    idOddel: number;
    dlzkaVysetrenia: number;
    pracovnaDobas: PracovnaDoba[];
}