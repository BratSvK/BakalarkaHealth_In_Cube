using HealthInCube_BackEnd.DTOs.Lekar.LekarTyp;
using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.PredpisanaLiecba;
using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.Recept;
using System;
using System.Collections.Generic;

namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.Vysetrenie
{
    /// <summary>
    /// Result of appointment
    /// </summary>
    public class VysetrenieDto
    {
        public decimal IdVysetrenie { get; set; } 
        /// <summary>
        /// Id of the patient health record.
        /// </summary>
        public decimal? IdPacient { get; set; }

        /// <summary>
        /// Id of the doctor who takes examination.
        /// </summary>
        public decimal? IdLekar { get; set; }

        /// <summary>
        /// Type of the examination.
        /// </summary>
        public decimal? IdTypVysetrenia { get; set; }

        /// <summary>
        /// Who do examination to the patient.
        /// </summary>
        public string MenoVysetrujuciLekar { get; set; }

        /// <summary>
        /// Date of the examination.
        /// </summary>
        public DateTimeOffset DatumVys { get; set; } = DateTimeOffset.UtcNow;

        /// <summary>
        /// Doctor's result of examination.
        /// </summary>
        public string Vysledok { get; set; }

        /// <summary>
        /// Attachment of the examination.
        /// </summary>
        public byte[] Priloha { get; set; }

        /// <summary>
        /// What type of revision.
        /// </summary>
        public string TypVysetreniaNazov { get; set; }

        /// <summary>
        /// All prediscribe threatments
        /// </summary>
        public ICollection<PredpisanaLiecbaDto> PredpLiecbas { get; set; }

        /// <summary>
        /// All reciepts.
        /// </summary>
        public ICollection<ReceptDto> Recepts { get; set; }
    }
}
