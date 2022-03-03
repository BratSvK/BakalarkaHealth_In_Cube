import { createFeatureSelector, createSelector } from "@ngrx/store";
import { Pouzivatel } from "src/app/models/pouzivatel";

export interface AuthState {
    user: Pouzivatel;
    authError: string;
    isLoading: boolean;
}

export const getPractitionerState = createFeatureSelector('auth');

export const getCurrentUserState = createSelector(
    getPractitionerState,
    (state: AuthState) => state.user
  );
