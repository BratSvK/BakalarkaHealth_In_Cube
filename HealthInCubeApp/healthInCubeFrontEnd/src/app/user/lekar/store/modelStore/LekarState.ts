import { createFeatureSelector, createSelector } from "@ngrx/store";
import { Lekar } from "src/app/models/lekar/lekar";
import { ZiadankaPacient } from "src/app/models/ziadanka/ziadankaPacient";

export interface LekarState {
    practitioner: Lekar, 
    ziadanky: ZiadankaPacient[]
}

export const getPractitionerState = createFeatureSelector('lekar');

export const getPractitionorIdState = createSelector(
    getPractitionerState,
    (state: LekarState) => state.practitioner?.idLekar
  );

  export const getPractitionerAtestationsId = createSelector(
    getPractitionerState,
    (state: LekarState) => state.practitioner?.atestacieId
  );

  export const getPractitionerAtestationsTypes = createSelector(
    getPractitionerState,
    (state: LekarState) => state.practitioner?.atestacieLekars
  );

  export const getPractitionerIsActivatedAccount= createSelector(
    getPractitionerState,
    (state: LekarState) => state.practitioner.isActivated
  );