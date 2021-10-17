import { Pouzivatel } from "src/app/models/pouzivatel";
import { UserToLogin } from "src/app/models/userToLogin";

export interface AuthState {
    user: Pouzivatel;
    authError: string;
    isLoading: boolean;
}