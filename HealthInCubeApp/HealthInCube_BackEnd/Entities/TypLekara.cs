using System;
using System.Collections.Generic;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public enum TypyLekara
    {
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
    public partial class TypLekara
    {
        public TypLekara()
        {
            AtestacieLekars = new HashSet<AtestacieLekar>();
        }

        public decimal IdTyp { get; set; }
        public string Nazov { get; set; }
        public string Popis { get; set; }

        public virtual ICollection<AtestacieLekar> AtestacieLekars { get; set; }
    }
}
