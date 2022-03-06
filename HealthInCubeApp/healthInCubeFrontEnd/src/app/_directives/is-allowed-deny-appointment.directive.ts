import {
  Directive,
  ElementRef,
  EventEmitter,
  Input,
  OnInit,
  Output,
} from '@angular/core';
import { addHours } from '../shared/common';

// vymazavanie a uakzovanie obsahu na stranke DOM
@Directive({
  selector: '[isAllowedDenyAppointment]'
})
export class IsAllowedDenyAppointment implements OnInit {
  @Input() isAllowedDenyAppointment = '';
  @Output() showTooltip =  new EventEmitter<boolean>();
  
  constructor(
    private el: ElementRef
  ) {
  }

  ngOnInit(): void {
    this.checkIfStartDateIs48Before();
  }

  private checkIfStartDateIs48Before() {
    var dateToCompare = addHours(new Date(this.isAllowedDenyAppointment), -48).getTime();
    var actualDate = new Date().getTime();
  
    if (actualDate > dateToCompare) {
      this.showTooltip.emit(true);
      this.el.nativeElement.disabled = true;
    } else {
      this.el.nativeElement.disabled = false;
    }
  }
}
