import { Component, Input, OnInit } from '@angular/core';
import { PredpisanaLiecba } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/predLiecba';
import { Recept } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/recept';

@Component({
  selector: 'app-vysetrenie-pred-liecba-zoznam',
  templateUrl: './pred-liecba-zoznam.component.html',
  styleUrls: ['./pred-liecba-zoznam.component.css']
})
export class PredLiecbaZoznamComponent implements OnInit {
  @Input() predLiecbaZoznam: PredpisanaLiecba[];
  @Input() receptZoznam: Recept[];


  constructor() { }

  ngOnInit(): void {
  }

  getReceptForLiecba(idLiek: number) {
    return this.receptZoznam.find(r => r.idLiek === idLiek);
  }
}
