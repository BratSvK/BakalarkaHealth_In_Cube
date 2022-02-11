import { createFeatureSelector, createSelector } from "@ngrx/store";
import { Lekar } from "src/app/models/lekar/lekar";
import { Ziadanka } from "src/app/models/ziadanka";

export interface LekarState {
    practitioner: Lekar, 
    ziadanky: Ziadanka[]
}

export const getPractitionerState = createFeatureSelector('lekar');

export const getPractitionorIdState = createSelector(
    getPractitionerState,
    (state: LekarState) => state.practitioner?.idLekar
  );

  export const getPractitionerAtestationsId = createSelector(
    getPractitionerState,
    (state: LekarState) => state.practitioner.atestacieId
  );