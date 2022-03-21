import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
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

  constructor(
    bsModalRef: BsModalRef,
    private router: Router) {
    super(bsModalRef);
   }

   goToZdravotnaKartaPatient() {
    const rootLekarSegment = this.getPatientZdravotnaKartaRoute(this.router.url.split('/'));
    this.router.navigate([
      rootLekarSegment[1], 
      rootLekarSegment[2],
      'patient', 
      this.sprievodka.idPacientNavigation.idPacient, 
      'zdravKarta']);
    this.bsModalRef.hide();
   }

   private getPatientZdravotnaKartaRoute(urlSegmentsArray: string[]): string[] {
    return urlSegmentsArray.slice(0, urlSegmentsArray.length - 1);
  }
}
