import { Injectable } from '@angular/core';
import { AbstractControl, FormGroup, ValidatorFn } from '@angular/forms';
import { Observable, Subject } from 'rxjs';
import { InputCommand, InputCommandType } from '../models/inputs.common';

interface TargetInputCommnand {
  command: InputCommand,
  targets: string[];
}

@Injectable({
  providedIn: 'root'
})
export class FormularService {

  private inputCommandSubject = new Subject<TargetInputCommnand>();

  get inputCommandsTrigger(): Observable<TargetInputCommnand> {
    return this.inputCommandSubject.asObservable();
  }

  triggerInputCommand(targets: string | string[], command: InputCommand) {
    setTimeout(() => {
      if (!Array.isArray(targets)) {
        targets = [targets];
      }
      this.inputCommandSubject.next({ targets, command}); 
    }, 0);
  } 

  focusAtFirstErrorInForm(formGroup: FormGroup, controlNamesMapping: Map<string, string> = null) {
    for (const key of Object.keys(formGroup.controls)) {
      if (!formGroup.controls[key].valid){
        let mappedControlName;
        if (controlNamesMapping) {
          mappedControlName = controlNamesMapping.get(key);
        }
        const controlName = mappedControlName ? mappedControlName : key;
        this.triggerInputCommand(controlName, {type: InputCommandType.FOCUS_INPUT});
        break;
      }
    }
  }

  matchLengthSize(matchToLength: number): ValidatorFn {
    return (control: AbstractControl) => {
      return control?.value?.length === matchToLength ? null : {isSameLength: true }
    };
  }
}
