import { Component, HostListener, OnInit } from '@angular/core';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { PacientCard } from 'src/app/models/pacient/pacientCard';
import { Recept } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/recept';
import { HealthRecordVysetrenieService } from 'src/app/_service/health-record-vysetrenie.service';
import { faEuroSign } from '@fortawesome/free-solid-svg-icons';
import * as moment from 'moment';


@Component({
  selector: 'app-zoznam-item-recept-modal',
  templateUrl: './recept-modal.component.html',
  styleUrls: ['./recept-modal.component.css']
})
export class ZoznamItemReceptModalComponent implements OnInit {
  closeBtnName: string;
  title: string;
  recept: Recept;
  pacientDetail: PacientCard;

  euroIcon = faEuroSign;


  constructor(
    public bsModalRef: BsModalRef,
    private healthRecordVysetrenieService: HealthRecordVysetrenieService
  ) {
    moment.locale('sk');
    this.pacientDetail = this.healthRecordVysetrenieService.getPacientDetail();
   }

   @HostListener('document:keydown.escape')
   closeSprievodkaForm() {
    this.bsModalRef.hide();
  }

get vystavenieDate() {
  return moment(new Date(this.recept.vystavenie)).format('DD-MMMM-YYYY HH:MM');
}

get vybranieDate() {
  return this.recept.vybranie !== null ? moment(new Date(this.recept.vybranie)).format('DD-MMMM-YYYY HH:MM') : 'nevybratý';
}

  ngOnInit(): void {
    console.log(this.recept);
  }

}
