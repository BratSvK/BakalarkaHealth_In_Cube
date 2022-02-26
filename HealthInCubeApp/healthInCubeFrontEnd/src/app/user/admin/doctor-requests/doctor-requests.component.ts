import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { faCheck } from '@fortawesome/free-solid-svg-icons';
import { ToastrService } from 'ngx-toastr';
import { Observable, of } from 'rxjs';
import { catchError, filter, tap } from 'rxjs/operators';
import { CreatePatient } from 'src/app/models/createPatient';
import { Nemocnica } from 'src/app/models/nemocnica/nemocnica';
import { ZiadankaLekar } from 'src/app/models/ziadanka/ziadankaLekar';
import { ZiadankaParams } from 'src/app/models/ziadanka/ziadankaParams';
import { notNull } from 'src/app/shared/common';
import { AdminService } from 'src/app/_service/admin.service';
import { NemocnicaService } from 'src/app/_service/nemocnica.service';
import { SubSink } from 'subsink';

@Component({
  selector: 'app-doctor-requests',
  templateUrl: './doctor-requests.component.html',
  styleUrls: ['./doctor-requests.component.css']
})
export class DoctorRequestsComponent implements OnInit, OnDestroy {

  checkIcon = faCheck;
  requests$: Observable<ZiadankaLekar[]>;
  nemocnicaForm: FormGroup;
  nemocnice$: Observable<Nemocnica[]>

  private subSink = new SubSink();

  constructor(
    private adminService: AdminService,
    private fb: FormBuilder,
    private nemocnicaService: NemocnicaService,
    private toastr: ToastrService
  ) { }
  

  ngOnInit(): void {
    this.initNemocnice();
    this.initForm();
  }

  private initNemocnice() {
    this.nemocnice$ = this.nemocnicaService.getNemocnice$();
  }


  private initForm() {
    this.nemocnicaForm = this.fb.group({
      idNemocnica: [null, [
        Validators.required
      ]],
    })
    this.listenToChangeNemocnicaId();
  }

  private listenToChangeNemocnicaId() {
    this.subSink.sink = this.nemocnicaForm.get('idNemocnica').valueChanges.pipe(
      filter(notNull),
    ).subscribe(idNemocnica => {
      this.initSprievodky(idNemocnica);
    });
  }

  private initSprievodky(idNemocnica: number) {
    var params = new ZiadankaParams(idNemocnica);
    this.requests$ = this.adminService.getSprievodkyByParams$(params);
  }


  onApproveDoctor(idUser: number) {
    var createPatienModel = this.createModelToCreationPatient(idUser);
    this.subSink.sink = this.adminService.activateDoctorAccount(createPatienModel).pipe(
      tap(() => this.adminService.removeFromCache(this.nemocnicaForm.get('idNemocnica').value)),
      catchError((error) => {
        this.toastr.error("Nastala chyba pri aktivácíí");
        return of(error);
      })
    ).subscribe(() => {
      this.initSprievodky(this.nemocnicaForm.get('idNemocnica').value);
      this.toastr.success("Lekár úspešne aktivovaný");
    });
  }

  ngOnDestroy(): void {
    this.subSink.unsubscribe();
  }

  private createModelToCreationPatient(idUser: number): CreatePatient {
    return {
      idUser: idUser
    };
  }

}
