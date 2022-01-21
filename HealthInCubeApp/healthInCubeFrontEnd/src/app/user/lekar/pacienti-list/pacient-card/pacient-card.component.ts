import { Component, Input, OnInit, ViewEncapsulation } from '@angular/core';
import { DomSanitizer } from '@angular/platform-browser';
import { PacientCard } from 'src/app/models/pacientCard';
import { extractFotoFromApi } from 'src/app/shared/foto-extract';
import { faNotesMedical, faEdit } from '@fortawesome/free-solid-svg-icons';
import { SprievodkaModalComponent } from '../../sprievodka/sprievodka-modal/sprievodka-modal.component';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';

@Component({
  selector: 'app-pacient-card',
  templateUrl: './pacient-card.component.html',
  styleUrls: ['./pacient-card.component.css'],
})
export class PacientCardComponent implements OnInit {
  @Input() patient: PacientCard;

  bsModalRef: BsModalRef;

  medicamentRecord = faNotesMedical;
  sprievodkaCreate = faEdit;

  constructor(private sanitizer: DomSanitizer, private modalService: BsModalService) {}

  ngOnInit(): void {}

  get photo(): any {
    if (this.patient.fotka !== null) {
      return extractFotoFromApi(this.patient.fotka, this.sanitizer);
    }
    return null;
  }

  openSprievodkaModal() {
    const config = {
      class: 'modal-dialog-centered',
      initialState: {
        list: [
          'Open a modal with component',
          'Pass your data',
          'Do something else',
          '...'
        ],
        title: 'Sprievodka',
        closeBtbName: 'Close',
        typeOfDoctors: [
          {
            id: 4,
            nazov: 'Očný'
          },
          {
            id: 60,
            nazov: 'Morfológ'
          }
        ],
        defaultSprievodkaData: {
          idPacient: this.patient.idPacient,
          patientName: this.patient.fullName,
          birthIDNumber: this.patient.bid
        }
      }
    };

    this.bsModalRef = this.modalService.show(SprievodkaModalComponent, config);
  }
}
