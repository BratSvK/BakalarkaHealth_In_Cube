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
  @Input() sprievodkaItems: SprievodkaPacientModel[] | SprievodkaLekarModel[]; 
  @Input() isPatient: boolean; 

  
  bsModalRef: BsModalRef;
  colorOfSprievodka: string [] = [];

  constructor(private modalService: BsModalService) { }

  ngOnInit(): void {
    this.initColorsToSprievodkas();
  }

  getDurationInMinutes(i: number): number {
    var difference = Math.abs(new Date(this.sprievodkaItems[i]?.terminOd).getTime() - 
                              new Date(this.sprievodkaItems[i]?.terminDo).getTime());
    return Math.floor((difference/1000)/60);
  }

  getPopisSprievodka(i: number) : string {
    return this.isPatient ? 
           this.sprievodkaItems[i].idTypLekarNavigation?.popis.split(',')[0] :
           (this.sprievodkaItems[i] as SprievodkaLekarModel).idPacientNavigation?.idPouzivatelNavigation?.fullName;
  }

  openSprievodkaItemModal(i: number) {
    this.isPatient ? 
      this.openSprievodkaPacientItemModal(i) : 
      this.openLekarSprievodkaModal(i);
  }

  openSprievodkaPacientItemModal(i: number) {
    const config = {
      class: 'modal-dialog-centered',
      initialState: {
        title: 'Plánované vyšetrenie',
        closeBtbName: 'Close',
        sprievodka: this.sprievodkaItems[i] as SprievodkaPacientModel,
      }
    };
    this.bsModalRef = this.modalService.show(ModalPacientComponent, config);
    
  }

  openLekarSprievodkaModal(i: number) {
    const config = {
      class: 'modal-dialog-centered',
      initialState: {
        title: 'Plánované vyšetrenie',
        closeBtbName: 'Close',
        sprievodka: this.sprievodkaItems[i] as SprievodkaLekarModel,
      }
    };
    this.bsModalRef = this.modalService.show(ModalLekarComponent, config);
  }

  private initColorsToSprievodkas() {
    for (let index = 0; index < this.sprievodkaItems.length; index++) {
      this.colorOfSprievodka.push(colorsDictionarySprievodka[this.sprievodkaItems[index]?.idTypLekarNavigation?.idTyp].color);
    }
  }

}
