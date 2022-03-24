import { Component, Input, OnInit } from '@angular/core';
import { PredpisanaLiecba } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/predLiecba';
import { faFilePrescription } from '@fortawesome/free-solid-svg-icons';
import { Recept } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/recept';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ZoznamItemReceptModalComponent } from '../recept-modal/recept-modal.component';


@Component({
  selector: 'app-zoznam-item-accordion-body',
  templateUrl: './accordion-body.component.html',
  styleUrls: ['./accordion-body.component.css']
})
export class ZoznamItemAccordionBodyComponent implements OnInit {
  @Input() liecba: PredpisanaLiecba;
  @Input() recept: Recept;

  bsModalRef: BsModalRef;
  davkovanie: {[dayPart: string]: number} = {};
  dayPart = ['rano', 'poobede', 'vecer'];
  receptIcon = faFilePrescription;


  constructor(private modalService: BsModalService,) { }

  ngOnInit(): void {
    console.log(this.recept);
    this.setDavkovanie();
  }

  openReceptModal() {
      const config = {
        class: 'modal-dialog-centered',
        initialState: {
          title: 'Sprievodka',
          closeBtbName: 'Close',
          recept: this.recept
        }
      };
  
      this.bsModalRef = this.modalService.show(ZoznamItemReceptModalComponent, config);
    }

  private setDavkovanie() {
    if (!!this.liecba.davkovaniePocet) {
      const davkovanieString = this.liecba.davkovaniePocet.toString();
      for (let i = 0; i < davkovanieString.length; i++) {
        this.davkovanie[this.dayPart[i]] = +davkovanieString.charAt(i);
      }
    }
  }
}
