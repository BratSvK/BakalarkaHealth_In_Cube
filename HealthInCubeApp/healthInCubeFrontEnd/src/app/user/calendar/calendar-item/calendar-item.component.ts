import { Component, Input, OnInit } from '@angular/core';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { colorsDictionarySprievodka } from 'src/app/models/sprievodka/sprievodkaFarby';
import { SprievodkaLekarModel, SprievodkaPacientModel } from 'src/app/models/sprievodka/sprievodkaModel';
import { ModalLekarComponent } from './calendar-item-modal/modal-lekar/modal-lekar.component';
import { ModalPacientComponent } from './calendar-item-modal/modal-pacient/modal-pacient.component';

@Component({
  selector: 'app-calendar-item',
  templateUrl: './calendar-item.component.html',
  styleUrls: ['./calendar-item.component.css']
})
export class CalendarItemComponent implements OnInit {
  @Input() sprievodkaItem: SprievodkaPacientModel | SprievodkaLekarModel; 
  @Input() isPatient: boolean; 

  
  bsModalRef: BsModalRef;
  colorOfSprievodka: string;

  constructor(private modalService: BsModalService) { }

  ngOnInit(): void {
    this.initColorToSprievodka();
  }

  getDurationInMinutes(): number {
    var difference = Math.abs(new Date(this.sprievodkaItem?.terminOd).getTime() - new Date(this.sprievodkaItem?.terminDo).getTime());
    return Math.floor((difference/1000)/60);
  }

  getPopisSprievodka() : string {
    return this.isPatient ? 
           this.sprievodkaItem.idTypLekarNavigation?.popis.split(',')[0] :
           (this.sprievodkaItem as SprievodkaLekarModel).idPacientNavigation?.idPouzivatelNavigation?.fullName;
  }

  openSprievodkaItemModal() {
    this.isPatient ? 
      this.openSprievodkaPacientItemModal() : 
      this.openLekarSprievodkaModal();
  }

  openSprievodkaPacientItemModal() {
    const config = {
      class: 'modal-dialog-centered',
      initialState: {
        title: 'Plánované vyšetrenie',
        closeBtbName: 'Close',
        sprievodka: this.sprievodkaItem as SprievodkaPacientModel,
      }
    };
    this.bsModalRef = this.modalService.show(ModalPacientComponent, config);
    
  }

  openLekarSprievodkaModal() {
    const config = {
      class: 'modal-dialog-centered',
      initialState: {
        title: 'Plánované vyšetrenie',
        closeBtbName: 'Close',
        sprievodka: this.sprievodkaItem as SprievodkaLekarModel,
      }
    };
    this.bsModalRef = this.modalService.show(ModalLekarComponent, config);
  }

  private initColorToSprievodka() {
    this.colorOfSprievodka = colorsDictionarySprievodka[this.sprievodkaItem?.idTypLekarNavigation?.idTyp].color;
  }

}
