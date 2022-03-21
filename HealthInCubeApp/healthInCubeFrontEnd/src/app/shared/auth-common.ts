import { HttpErrorResponse } from '@angular/common/http';
import { AbstractControl, ValidatorFn } from '@angular/forms';

export function handleError(errorRes: HttpErrorResponse) {
  let errorMessage = 'Nastala neočakávaná chyba!';
  if (!errorRes.error) {
    return errorMessage;
  }

  switch (errorRes.error) {
    case 'Email is taken!!':
    case 'EMAIL_EXISTS':
      errorMessage = 'Email existuje!';
      break;
    case 'EMAIL_NOT_FOUND':
      errorMessage = 'Tento úceť neexistuje!';
      break;
    case 'INVALID_CREDENTIALS':
      errorMessage = 'Zlé prihlasovanie údaje!';
      break;
  }
  return errorMessage;
}


export function matchValues(matchTo: string): ValidatorFn {
  return (control: AbstractControl) => {
    return control?.value === control?.parent?.controls[matchTo].value
      ? null
      : { isMatching: true }; // return null ak prejde validacia
  };
}


export const enum AccountType {
  admin = 'admin',
  doctor ='practitioner',
  patient = 'patient'
}