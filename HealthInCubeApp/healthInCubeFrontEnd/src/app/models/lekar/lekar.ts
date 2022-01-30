
export interface Lekar {
    idLekar: number;
    meno: string;
    priezvisko: string;
    mobil: string;
    email: string;
    fullName: string;
    nemocnica: string;
    oddelenieNazov: string;
    fotka: any;
    // atestacie: AtestacieLekar[];
}

export enum TypyLekara {
    Akupunkturista = 1,
    AlergológAImunológ,
    Algeziológ,
    Anestéziológ,
    Angiochirurg,
    Angiológ,
    Audiológ,
    Chirurg,
    Cytológ,
    Dermatológ,
    Dermatovenerológ,
    Diabetológ,
    Diagnostik,
    Endokrinológ,
    Epidemiológ,
    Foniatrik,
    Ftizeológ,
    Fyzioterapeut,
    Gastroenterológ,
    Genetik,
    Geriater,
    Gerontológ,
    Gynekológ,
    GynekológAPôrodník,
    Hematológ,
    Hepatológ,
    Histológ,
    Homeopat,
    Hygienik,
    Infektológ,
    Internista,
    Kardiochirurg,
    Kardiológ,
    KlinickýADopravnýPsychológ,
    KlinickýBiochemik,
    Logopéd,
    Mamológ,
    Mikrobiológ,
    Nefrológ,
    Neonatológ,
    Neurochirurg,
    Neurológ,
    Nozológ,
    Oftalmológ,
    Onkológ,
    Ortopéd,
    Otorinolaryngológ,
    Patológ,
    Pediater,
    PlastickýChirurg,
    Pneumológ,
    PraktickýLekár,
    Psychiater,
    Psychológ,
    Radiológ,
    Rádioterapeut,
    RehabilitačnýLekár,
    Reumatológ,
    Sexuológ,
    Stomatológ,
    Toxikológ,
    Traumatológ,
    Urológ,
    Venerológ,
    VšeobecnýLekárPreDetiADorast,
    VšeobecnLekárPreDospelých
}