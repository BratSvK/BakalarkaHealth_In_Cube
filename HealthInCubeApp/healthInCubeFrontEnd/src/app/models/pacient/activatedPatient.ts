export interface ActivatedPatient {
    idPacient: number;
    isActivated: boolean;
}

export class DefaultActivatedPatientModel implements ActivatedPatient {
    idPacient: -1;
    isActivated: false;
}