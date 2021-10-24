import { Injectable } from '@angular/core';
import { CanDeactivate } from '@angular/router';
import { RegisterComponent } from '../auth/register/register.component';

@Injectable({
  providedIn: 'root'
})
export class PreventUnsavedChangesGuard implements CanDeactivate<unknown> {
  canDeactivate(component: RegisterComponent): boolean {
    if (component.registerForm.dirty) {
      // only without modal for now 
      return confirm('Are you sure you want to continue? Any unsaved changes will be lost');      //Yes/NO
    }
    return true;
  }
  
}
