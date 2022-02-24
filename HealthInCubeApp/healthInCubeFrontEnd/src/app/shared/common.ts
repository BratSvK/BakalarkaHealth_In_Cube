import { TimepickerConfig } from "ngx-bootstrap/timepicker";
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

 


