import { Component, HostListener, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { SprievodkaFormModel } from 'src/app/models/sprievodkaFormModel';
import { FormularService } from 'src/app/_service/formular.service';
import { SubSink } from 'subsink';

import { faInfoCircle } from '@fortawesome/free-solid-svg-icons';
import { BsDaterangepickerConfig } from 'ngx-bootstrap/datepicker';

@Component({
  selector: 'app-sprievodka-modal',
  templateUrl: './sprievodka-modal.component.html',
  styleUrls: ['./sprievodka-modal.component.css']
})
export class SprievodkaModalComponent implements OnInit, OnDestroy {
  sprievodkaHeaderText: string = 'Vytvoriť sprievodku';
  list: any[] = [];
  closeBtnName: string;
  sprievodkaForm: FormGroup;
  infoTooltip = faInfoCircle;

  infoVysetrenie = 'očný lekár, zaoberá sa výskumom, diagnózou, prevenciou a liečbou očných chorôb';

  private subs = new SubSink();

  bsConfig?: Partial<BsDaterangepickerConfig>;

  typeOfDoctors: {id: number, nazov: string}[] = [];
  private readonly defaultSprievodkaData: SprievodkaFormModel;

  constructor(public bsModalRef: BsModalRef, fb: FormBuilder, private formService: FormularService) {
    this.sprievodkaForm = fb.group({
      idPacient: ['', [Validators.required]],
      birthIDNumber: ['', [Validators.required]],
      patientName: ['', [Validators.required]],
      idTypVysetrenia: ['' , [Validators.required]],
      idLekar: ['', [Validators.required]],
      lekarName: ['', [Validators.required]],
      dlzkaVysetrenia: ['', [Validators.required]],
      terminDatum: ['', [Validators.required]]
    });
  }
  ngOnDestroy(): void {
    this.subs.unsubscribe();
  }

  ngOnInit(): void {
    this.sprievodkaForm.patchValue({
      ...this.defaultSprievodkaData,
      idTypVysetrenia: this.typeOfDoctors[0]?.id
    });
    console.log(this.sprievodkaForm.get('idPacient').value);
  } 

  createSprievodka() {
    this.sprievodkaForm.markAllAsTouched();
    if (this.sprievodkaForm.invalid) {
      this.formService.focusAtFirstErrorInForm(this.sprievodkaForm);
      return;
    }
    
  }

  @HostListener('document:keydown.escape')
  closeSprievodkaForm() {
    this.subs.unsubscribe();
    this.bsModalRef.hide();
  }
}
