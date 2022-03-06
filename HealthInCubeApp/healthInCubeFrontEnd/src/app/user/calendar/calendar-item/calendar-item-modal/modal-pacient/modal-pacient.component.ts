import { Component, EventEmitter, Output } from '@angular/core';
import { Store } from '@ngrx/store';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { take } from 'rxjs/operators';
import { SprievodkaDelete } from 'src/app/models/sprievodka/sprievodkaDelete';
import { SprievodkaPacientModel } from 'src/app/models/sprievodka/sprievodkaModel';
import { getPatientId } from 'src/app/user/patient/store/modelStore/PatientState';
import { SprievodkaService } from 'src/app/_service/sprievodka.service';
import { AppState } from 'src/app/_store/models/AppState';
import { CalendarItemModalBaseComponent } from '../modal-base/calendar-item-modal.component';

@Component({
  selector: 'app-modal-pacient',
  templateUrl: './modal-pacient.component.html',
  styleUrls: ['./modal-pacient.component.css']
})
export class ModalPacientComponent extends CalendarItemModalBaseComponent  { 

  sprievodka: SprievodkaPacientModel;
  showTooltip = false;
  idPatient: number;
  dovodZrusenia = '';
  deletedIndex;

  constructor(
    private sprievodkaService: SprievodkaService,
    private toastr: ToastrService,
    private store: Store<AppState>,
    bsModalRef: BsModalRef
    ) { 
    super(bsModalRef);

    this.store.select(getPatientId).pipe(take(1)).subscribe(id => this.idPatient = id );
  }

  showValueFromEmit(event: boolean) {
    this.showTooltip = event;
  }

  denyAppointment() {
  let sprievodkaDeleteModel = this.buildSprievodkaModel();
  if (sprievodkaDeleteModel === null)
  {
    return;
  }
    this.sprievodkaService.deleteSprievodka(sprievodkaDeleteModel).then(() => {
      this.toastr.success("Termín úspešne zrušený.");
      this.sprievodkaService.isDeletedSuccess(this.deletedIndex);
      this.closeSprievodkaForm()
    })
  }

  private buildSprievodkaModel() : SprievodkaDelete  {
    if (this.isEmptyOrSpaces(this.dovodZrusenia))
    {
      this.toastr.warning("Prosím vyplnte dôvod zrušenia termínu");
      return null;
    }
    return {
     idPacient: this.idPatient,
     idLekar: this.sprievodka.idLekarNavigation.idLekar,
     terminOd: this.sprievodka.terminOd,
     zrusenieDovod: this.dovodZrusenia
    }
  }

   private isEmptyOrSpaces(str: string){
    return str === null || str.match(/^ *$/) !== null;
}
}
