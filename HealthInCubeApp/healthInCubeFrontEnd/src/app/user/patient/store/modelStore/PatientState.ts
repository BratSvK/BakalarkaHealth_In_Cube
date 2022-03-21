import { createFeatureSelector, createSelector } from "@ngrx/store";
import { ActivatedPatient } from "src/app/models/pacient/activatedPatient";

export interface PatientState {
    activatedPatient: ActivatedPatient
}

export const getPatientState = createFeatureSelector('patient');

export const getPatientId = createSelector(
    getPatientState,
    (state: PatientState) => state.activatedPatient?.idPacient
  );

  export const getIsActivated = createSelector(
    getPatientState,
    (state: PatientState) => state.activatedPatient?.isActivated
  );
  