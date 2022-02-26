import { Component, OnInit } from '@angular/core';
import { faCalendarCheck } from '@fortawesome/free-solid-svg-icons';
import { BsModalRef } from 'ngx-bootstrap/modal';


@Component({
  selector: 'app-calendar-changed-modal',
  templateUrl: './calendar-changed-modal.component.html',
  styleUrls: ['./calendar-changed-modal.component.css']
})
export class CalendarChangedModalComponent implements OnInit {
  caption: string;
  message: string;
  acceptButton: string;
  closeOnEscClick: boolean;
  iconWarning = faCalendarCheck;

  constructor(public bsModalRef: BsModalRef) { }

  ngOnInit(): void {
  }

  acceptChanges() {
    this.bsModalRef.hide();
  }

}
