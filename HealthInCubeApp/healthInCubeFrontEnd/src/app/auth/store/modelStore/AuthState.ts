import { Pouzivatel } from "src/app/models/pouzivatel";

export interface AuthState {
    user: Pouzivatel;
    authError: string;
    isLoading: boolean;
}