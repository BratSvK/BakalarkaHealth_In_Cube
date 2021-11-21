import { Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Store } from '@ngrx/store';
import { Subscription } from 'rxjs';
import { Bydlisko } from 'src/app/models/bydlisko';
import { CreateBydlisko } from 'src/app/models/createBydlisko';
import { AppState } from 'src/app/_store/models/AppState';

import * as UserDetailActionsBundle from '../store/user-detail.actions';


@Component({
  selector: 'app-user-bydlisko-editor',
  templateUrl: './user-bydlisko-editor.component.html',
  styleUrls: ['./user-bydlisko-editor.component.css']
})
export class UserBydliskoEditorComponent implements OnInit, OnDestroy {
  
  @ViewChild('editForm', {static: false}) editForm: NgForm;


  editMode = false;
  editedItem: Bydlisko;

  private subscription: Subscription;



  constructor(private store: Store<AppState>) { }
  

  ngOnInit(): void {

    this.subscription = this.store.select('userDetail').subscribe(userDetailData => {
      if (userDetailData.editedBydliskoIndex > -1) {
        this.editMode = true;
        this.editedItem = userDetailData.editedBydlisko;

        this.editForm.setValue({
          mesto: this.editedItem.idMestoNavigation.nazov,
          ulica: this.editedItem.ulica,
          idMesto: this.editedItem.idMestoNavigation.idMesto,
          trvale: this.editedItem.trvale
        });

      } else {  
        this.editMode = false;
      }
    });
  }

  onChangeCity() {
    
  }


  onSubmit(form: NgForm) {
    const value = form.value;
    const newBydlisko: CreateBydlisko = {
      ulica: value.ulica,
      idMesto: value.idMesto,
      trvale: value.trvale
    };

    if (this.editMode) {
      newBydlisko.idBydliska = this.editedItem.idBydliska;
      this.store.dispatch(new UserDetailActionsBundle.UpdateBydlisko(newBydlisko));
    } else {
      this.store.dispatch(new UserDetailActionsBundle.AddBydlisko(newBydlisko));
    }
  }

  ngOnDestroy(): void {
    if (this.subscription) 
      this.subscription.unsubscribe();
  }

}
