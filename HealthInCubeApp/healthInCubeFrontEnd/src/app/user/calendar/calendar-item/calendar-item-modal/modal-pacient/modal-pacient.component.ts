import { Component, OnInit } from '@angular/core';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { SprievodkaPacient } from 'src/app/models/pacient/pacientSprievodka';
import { SprievodkaPacientModel } from 'src/app/models/sprievodka/sprievodkaModel';
import { CalendarItemModalBaseComponent } from '../modal-base/calendar-item-modal.component';

@Component({
  selector: 'app-modal-pacient',
  templateUrl: './modal-pacient.component.html',
  styleUrls: ['./modal-pacient.component.css']
})
export class ModalPacientComponent extends CalendarItemModalBaseComponent {
  sprievodka: SprievodkaPacientModel;

  constructor(bsModalRef: BsModalRef) { 
    super(bsModalRef);
  }


}
