import { Directive, ElementRef, Input } from '@angular/core';

@Directive({
  selector: '[hasFocus]'
})
export class HasFocusDirective {

  @Input("hasFocus") hasFocus: boolean;
  constructor(private elementRef: ElementRef) {}

  ngAfterViewInit()
  {
      if (this.hasFocus)
      {
          this.elementRef.nativeElement.focus();
      }
  }
}
