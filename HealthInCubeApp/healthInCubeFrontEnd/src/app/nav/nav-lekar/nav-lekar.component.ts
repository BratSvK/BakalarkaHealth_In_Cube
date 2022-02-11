import { Component, OnInit } from '@angular/core';
import { faStethoscope, faUserCheck, faUsers, faChevronDown } from '@fortawesome/free-solid-svg-icons';
import { Store } from '@ngrx/store';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { Observable } from 'rxjs';
import { map, take } from 'rxjs/operators';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { SprievodkaModalComponent } from 'src/app/user/lekar/sprievodka/sprievodka-modal/sprievodka-modal.component';
import { LekarService } from 'src/app/_service/lekar.service';
import { AppState } from 'src/app/_store/models/AppState';


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
  loginDoctorId$: Observable<number>;


  users = faUsers;
  userCheck = faUserCheck;
  stethoscope = faStethoscope;
  arrowDown = faChevronDown;

  constructor(
    private store: Store<AppState>, 
    private modalService: BsModalService,
    private lekarService: LekarService
  ) { }

  ngOnInit(): void {
    this.store.select('auth').pipe(take(1),map(resData => {
      return resData.user;
    })).subscribe(user => {
      this.user = user;
    });

    this.loginDoctorId$ = this.lekarService.getLoginDoctorId$();
  }

  openSprievodkaModal() {
    const config = {
      class: 'modal-dialog-centered',
      initialState: {
        title: 'Sprievodka',
        closeBtbName: 'Close'
      }
    };

    this.bsModalRef = this.modalService.show(SprievodkaModalComponent, config);
  }
}
