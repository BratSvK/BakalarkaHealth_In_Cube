import { Component, HostListener, OnInit } from '@angular/core';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { Recept } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/recept';

@Component({
  selector: 'app-zoznam-item-recept-modal',
  templateUrl: './recept-modal.component.html',
  styleUrls: ['./recept-modal.component.css']
})
export class ZoznamItemReceptModalComponent implements OnInit {
  closeBtnName: string;
  title: string;
  recept: Recept;

  constructor(public bsModalRef: BsModalRef) { }

   @HostListener('document:keydown.escape')
   closeSprievodkaForm() {
    this.bsModalRef.hide();
  }

  ngOnInit(): void {
  }

}
