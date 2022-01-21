import { Component, OnInit } from '@angular/core';
import { faStethoscope, faUserCheck, faUsers, faChevronDown } from '@fortawesome/free-solid-svg-icons';
import { Store } from '@ngrx/store';
import { BsModalRef, BsModalService, ModalOptions } from 'ngx-bootstrap/modal';
import { map, take } from 'rxjs/operators';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { SprievodkaModalComponent } from 'src/app/user/lekar/sprievodka/sprievodka-modal/sprievodka-modal.component';
import { AppState } from 'src/app/_store/models/AppState';
import { SprievodkaFormModel } from 'src/app/models/sprievodkaFormModel';


@Component({
  selector: 'app-nav-lekar',
  templateUrl: './nav-lekar.component.html',
  styleUrls: ['./nav-lekar.component.css']
})
export class NavLekarComponent implements OnInit {
  bsModalRef: BsModalRef;

  isCollapsed = false;
  user: Pouzivatel;
  isActivatedPatientFlag: boolean;
  image: any;

  users = faUsers;
  userCheck = faUserCheck;
  stethoscope = faStethoscope;
  arrowDown = faChevronDown;

  constructor(private store: Store<AppState>, private modalService: BsModalService) { }

  ngOnInit(): void {
    this.store.select('auth').pipe(take(1),map(resData => {
      return resData.user;
    })).subscribe(user => {
      this.user = user;
    });
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
          idPacient: 2
        }
      }
    };

    this.bsModalRef = this.modalService.show(SprievodkaModalComponent, config);
  }
}
