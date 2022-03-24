import { Component, Input, OnInit } from '@angular/core';
import * as moment from 'moment';
import { PredpisanaLiecba } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/predLiecba';
import { faCaretRight } from '@fortawesome/free-solid-svg-icons';
import { Recept } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/recept';


@Component({
  selector: 'app-vysetrenie-pred-liecba-zoznam-item',
  templateUrl: './zoznam-item.component.html',
  styleUrls: ['./zoznam-item.component.css']
})
export class PredLiecbaZoznamItemComponent implements OnInit {
  @Input() liecba: PredpisanaLiecba;
  @Input() recept: Recept;


  caretIcon = faCaretRight;

  
  constructor() {
    moment.locale('sk');
   }

  get title() {
    return `Začiatok liečby dňa ${moment(this.liecba.od).format('DD.MMMM.YYYY')}`
  }
  ngOnInit(): void {
  }

}
