import { Router } from "@angular/router";
import { TimepickerConfig } from "ngx-bootstrap/timepicker";
import { VykVysetrenie } from "../models/pacient/zdravotnaKarta/vykovaneVysetrenia/vykonaneVysetrenia";
import { DEFAULT_TIME_PER_PATIENT } from "./defaults";

export function extractKeyFromParams(params: any): string {
    return Object.values(params).join('-');
}

export const notNull = (data) => data !== null;

export const notUndefined = (data) => data !== undefined;



export function getTimepickerConfig(): TimepickerConfig {
    return Object.assign(new TimepickerConfig(), {
      minuteStep: DEFAULT_TIME_PER_PATIENT,
      showMeridian: false,
      readonlyInput: false,
      mousewheel: true,
      showMinutes: true,
      showSeconds: false,
      labelHours: 'Hodiny',
      labelMinutes: 'Minúty',
      labelSeconds: 'Sekundy'
    });
  }


  export function addHours(date, hours) {
    const newDate = new Date(date);
    newDate.setHours(newDate.getHours() + hours);
    return newDate;
  }

  export function getTypeOfAccount(router: Router): string {
    return router.parseUrl(router.url).root.children?.primary.segments[0].path;
  }


  export interface HealthRecordVysetrenieAttachmentZip {
    vysetrenie: VykVysetrenie,
    hesloPacient: string;
    menoPacient: string;
  }

 


