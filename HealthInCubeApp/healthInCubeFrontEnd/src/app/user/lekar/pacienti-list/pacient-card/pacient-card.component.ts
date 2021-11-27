import { Component, Input, OnInit, ViewEncapsulation } from '@angular/core';
import { DomSanitizer } from '@angular/platform-browser';
import { PacientCard } from 'src/app/models/pacientCard';
import { extractFotoFromApi } from 'src/app/shared/foto-extract';
import { faNotesMedical } from '@fortawesome/free-solid-svg-icons';


@Component({
  selector: 'app-pacient-card',
  templateUrl: './pacient-card.component.html',
  styleUrls: ['./pacient-card.component.css']
})
export class PacientCardComponent implements OnInit {
  @Input() patient: PacientCard;

  medicamentRecord = faNotesMedical;

  constructor(private sanitizer: DomSanitizer) { }

  ngOnInit(): void {
  }


  get photo(): any {
    return extractFotoFromApi(this.patient.fotka, this.sanitizer);
  }
}
