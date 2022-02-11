import { Directive, HostListener, OnDestroy, OnInit } from '@angular/core';
import { faInfoCircle } from '@fortawesome/free-solid-svg-icons';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { SubSink } from 'subsink';

@Directive()
export abstract class CalendarItemModalBaseComponent implements OnInit, OnDestroy {
  closeBtnName: string;
  title: string;
  infoTooltip = faInfoCircle;

  private subs = new SubSink();

  @HostListener('document:keydown.escape')
   closeSprievodkaForm() {
    this.subs.unsubscribe();
    this.bsModalRef.hide();
  }

  constructor(public bsModalRef: BsModalRef) { }
  
  ngOnDestroy(): void {
    this.subs.unsubscribe();
  }

  ngOnInit(): void {
  }

}
