import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { faChevronRight } from '@fortawesome/free-solid-svg-icons';
import { VykVysetrenie } from 'src/app/models/pacient/zdravotnaKarta/vykovaneVysetrenia/vykonaneVysetrenia';

export interface VysetrenieData {
  isHeaderClicked: boolean;
  vysetrenie: VykVysetrenie;
}

@Component({
  selector: 'app-health-record-vysetrenia-item',
  templateUrl: './health-record-vysetrenia-item.component.html',
  styleUrls: ['./health-record-vysetrenia-item.component.css']
})
export class HealthRecordVysetreniaItemComponent implements OnInit {
  @Output() isClicked = new EventEmitter<number>();
  @Input() vysetrenieData: VysetrenieData;

  arrowIcon = faChevronRight;

  constructor() { }

  ngOnInit(): void {
  }

  get vysetrenieCaption(): string {
    return `Č.${this.vysetrenieData.vysetrenie.idVysetrenie}-${this.vysetrenieData.vysetrenie.typVysetreniaNazov}: 
            Dátum vyšetrenia ${new Date(this.vysetrenieData.vysetrenie.datumVys).toLocaleString()}`
  }

  openVysetrenieView() {
    this.isClicked.emit(this.vysetrenieData.vysetrenie.idVysetrenie);
  }
}
