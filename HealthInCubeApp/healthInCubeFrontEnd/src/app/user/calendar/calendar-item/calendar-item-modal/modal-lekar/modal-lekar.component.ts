import { Component, OnInit } from '@angular/core';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { SprievodkaLekarModel } from 'src/app/models/sprievodka/sprievodkaModel';
import { CalendarItemModalBaseComponent } from '../modal-base/calendar-item-modal.component';

@Component({
  selector: 'app-modal-lekar',
  templateUrl: './modal-lekar.component.html',
  styleUrls: ['./modal-lekar.component.css']
})
export class ModalLekarComponent extends CalendarItemModalBaseComponent {
  sprievodka: SprievodkaLekarModel;

  constructor(bsModalRef: BsModalRef) {
    super(bsModalRef);
   }


}
