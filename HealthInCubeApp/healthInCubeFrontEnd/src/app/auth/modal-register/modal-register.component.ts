import { Component, EventEmitter, OnInit } from '@angular/core';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { CalendarItemModalBaseComponent } from 'src/app/user/calendar/calendar-item/calendar-item-modal/modal-base/calendar-item-modal.component';

@Component({
  selector: 'app-modal-register',
  templateUrl: './modal-register.component.html',
  styleUrls: ['./modal-register.component.css']
})
export class ModalRegisterComponent extends CalendarItemModalBaseComponent implements OnInit {
  public openRegisterPageLekar: EventEmitter<boolean> = new EventEmitter();

  constructor(bsModalRef: BsModalRef) { 
    super(bsModalRef);
  }

  ngOnInit(): void {
  }

  openLekarRegister(isGoingToLekarPage: boolean) {
    this.triggerEvent(isGoingToLekarPage);
    this.bsModalRef.hide();
  }

  private triggerEvent(isGoingToLekarPage: boolean) {
    this.openRegisterPageLekar.emit(isGoingToLekarPage);
  }

}
