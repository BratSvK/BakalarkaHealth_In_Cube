import { Component, EventEmitter, Input, OnDestroy, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { SprievodkaLekarModel, SprievodkaPacientModel } from 'src/app/models/sprievodka/sprievodkaModel';
import { SprievodkaService } from 'src/app/_service/sprievodka.service';
import { SubSink } from 'subsink';
import { ModalLekarComponent } from './calendar-item-modal/modal-lekar/modal-lekar.component';
import { ModalPacientComponent } from './calendar-item-modal/modal-pacient/modal-pacient.component';

@Component({
  selector: 'app-calendar-item',
  templateUrl: './calendar-item.component.html',
  styleUrls: ['./calendar-item.component.css']
})
export class CalendarItemComponent implements OnInit, OnDestroy {
  @Input() sprievodkaItems: SprievodkaPacientModel[] | SprievodkaLekarModel[]; 
  @Input() isPatient: boolean; 
  @Input() colorsSprievodka: string [];
  @Output() isDenySuccess: EventEmitter<number> = new EventEmitter<number>();

  
  bsModalRef: BsModalRef;

  private subSink = new SubSink();

  constructor(
    private modalService: BsModalService,
    private sprievodkaService: SprievodkaService
  ) { }

  ngOnDestroy(): void {
    if (this.subSink)
    this.subSink.unsubscribe();
  }

  ngOnInit(): void {
    this.sprievodkaDeletedListener();
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
        deletedIndex: i,
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

  private sprievodkaDeletedListener()
  {
    this.subSink.sink = this.sprievodkaService.isDeletedListener$.subscribe((isDeleted) => {
      this.isDenySuccess.emit(isDeleted);
    });
  }

}
