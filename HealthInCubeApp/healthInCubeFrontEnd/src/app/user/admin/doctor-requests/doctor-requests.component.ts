import { Component, OnDestroy, OnInit } from '@angular/core';
import { faCheck } from '@fortawesome/free-solid-svg-icons';
import { ZiadankaLekar } from 'src/app/models/ziadanka/ziadankaLekar';
import { ZiadankaParams } from 'src/app/models/ziadanka/ziadankaParams';
import { AdminService } from 'src/app/_service/admin.service';
import { SubSink } from 'subsink';

@Component({
  selector: 'app-doctor-requests',
  templateUrl: './doctor-requests.component.html',
  styleUrls: ['./doctor-requests.component.css']
})
export class DoctorRequestsComponent implements OnInit, OnDestroy {

  checkIcon = faCheck;
  requests: ZiadankaLekar[] = [];

  private subSink = new SubSink();

  constructor(private adminService: AdminService) { }
  

  ngOnInit(): void {
    
  }


  private initSprievodky() {
    var params = new ZiadankaParams(-1);
    this.subSink.sink = this.adminService.getSprievodkyByParams$(params)
        .subscribe(resquests => this.requests = resquests);
  }


  onApproveDoctor(idUser: number) {
    // var createPatienModel = this.createModelToCreationPatient(idUser);
    // this.store.dispatch(new LekarActionsBundle.AcceptRequest(createPatienModel));
  }

  ngOnDestroy(): void {
    this.subSink.unsubscribe();
  }

}
