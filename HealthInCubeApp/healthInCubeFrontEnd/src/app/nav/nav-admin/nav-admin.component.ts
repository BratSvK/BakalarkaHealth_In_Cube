import { Component, OnInit } from '@angular/core';
import { faChevronDown, faStethoscope, faUserCheck, faUsers } from '@fortawesome/free-solid-svg-icons';
import { Store } from '@ngrx/store';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { map, take } from 'rxjs/operators';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { AdminService } from 'src/app/_service/admin.service';
import { AppState } from 'src/app/_store/models/AppState';

@Component({
  selector: 'app-nav-admin',
  templateUrl: './nav-admin.component.html',
  styleUrls: ['./nav-admin.component.css']
})
export class NavAdminComponent implements OnInit {
  bsModalRef: BsModalRef;
  isCollapsed = false;
  user: Pouzivatel;
  isActivatedPatientFlag: boolean;
  image: any;

  users = faUsers;
  userCheck = faUserCheck;
  stethoscope = faStethoscope;
  arrowDown = faChevronDown;

  constructor(
    private store: Store<AppState>,
    private adminService: AdminService  
    ) { }

  ngOnInit(): void {
    this.store.select('auth').pipe(take(1),
    map(resData => {
      return resData.user;
    })).subscribe(user => {
      this.user = user;
    });
  }

  clearCacheOfAdmin() {
    this.adminService.clearCacheOfRequests();
  }

}
