import { LEADING_TRIVIA_CHARS } from '@angular/compiler/src/render3/view/template';
import { Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Store } from '@ngrx/store';
import { Observable, Subscription } from 'rxjs';
import { map, take } from 'rxjs/operators';
import { Bydlisko } from 'src/app/models/bydlisko';
import { CreateBydlisko } from 'src/app/models/createBydlisko';
import { Mesto } from 'src/app/models/mesto';
import { AppState } from 'src/app/_store/models/AppState';

import * as UserDetailActionsBundle from '../store/user-detail.actions';

@Component({
  selector: 'app-user-bydlisko-editor',
  templateUrl: './user-bydlisko-editor.component.html',
  styleUrls: ['./user-bydlisko-editor.component.css'],
})
export class UserBydliskoEditorComponent implements OnInit, OnDestroy {
  @ViewChild('editForm', { static: true }) editForm: NgForm;
  editMode = false;
  editedItem: Bydlisko;
  mesta$: Observable<Mesto[]>;
  selectedIdMesto: number;

  private subscription: Subscription;
  private formChangesSubscription: Subscription;

  constructor(private store: Store<AppState>) {
    this.mesta$ = this.store.select('userDetail').pipe(
      map((userDetailData) => {
        return userDetailData.mesta;
      })
    );
  }

  ngOnInit(): void {
    this.formChangesSubscription = this.editForm.form.valueChanges.subscribe(
      (x) => {
        if (x.mesto) {
          this.onChangeCity(x.mesto);
        }
      }
    );

    this.subscription = this.store
      .select('userDetail')
      .subscribe((userDetailData) => {
        if (userDetailData.editedBydliskoIndex > -1) {
          this.editMode = true;
          this.editedItem = userDetailData.editedBydlisko;

          this.editForm.setValue({
            mesto: this.editedItem.idMestoNavigation.nazov,
            ulica: this.editedItem.ulica,
            idMesto: this.editedItem.idMestoNavigation.idMesto,
            trvale: this.editedItem.trvale,
          });
        } else {
          this.editMode = false;
        }
      });
  }

  onReset() {
    this.editMode = false;
    this.editForm.reset();
    this.store.dispatch(new UserDetailActionsBundle.StopEdit());
  }

  onChangeCity(nazovMesto: string) {
    if (nazovMesto != ' ') {
      this.mesta$
        .pipe(
          take(1),
          map((mesta) => {
            const mesto = mesta.filter(
              (mesto) => mesto.nazov === nazovMesto
            )[0];
            return mesto.idMesto;
          })
        )
        .subscribe((idMesto) => {
          this.selectedIdMesto = idMesto;
        });
    }
  }

  onSubmit(form: NgForm) {
    const value = form.value;
    const newBydlisko: CreateBydlisko = {
      ulica: value.ulica,
      idMesto: value.idMesto,
      trvale: value.trvale ? true : false,
      idMestoNavigation: { idMesto: value.idMesto, nazov: value.mesto },
    };

    if (this.editMode) {
      newBydlisko.idBydliska = this.editedItem.idBydliska;
      this.store.dispatch(
        new UserDetailActionsBundle.UpdateBydlisko(newBydlisko)
      );
    } else {
      this.store.dispatch(new UserDetailActionsBundle.AddBydlisko(newBydlisko));
    }
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
    this.formChangesSubscription.unsubscribe();
  }
}
