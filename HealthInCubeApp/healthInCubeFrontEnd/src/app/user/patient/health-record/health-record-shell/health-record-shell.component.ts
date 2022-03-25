import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { map, switchMap } from 'rxjs/operators';
import { ZdravotnaKarta } from 'src/app/models/pacient/zdravotnaKarta/zdravotnaKarta';
import { AccountType } from 'src/app/shared/auth-common';
import { getTypeOfAccount, HealthRecordVysetrenieAttachmentZip } from 'src/app/shared/common';
import { HealthRecordVysetrenieService } from 'src/app/_service/health-record-vysetrenie.service';
import { HealthRecordService } from 'src/app/_service/health-record.service';
import { SubSink } from 'subsink';

import * as FileSaver from 'file-saver';
import * as moment from 'moment';
import * as JSZip from 'jszip';

@Component({
  selector: 'app-health-record-shell',
  templateUrl: './health-record-shell.component.html',
  styleUrls: ['./health-record-shell.component.css']
})
export class HealthRecordShellComponent implements OnInit, OnDestroy {
  healthRecord$: Observable<ZdravotnaKarta>;

  private subs = new SubSink();

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private healthRecordService: HealthRecordService,
    private healthRecordVysetrenieService: HealthRecordVysetrenieService
  ) {
   }
  ngOnDestroy(): void {
    if (getTypeOfAccount(this.router) === AccountType.doctor) {
      this.healthRecordService.clearHealthRecordCache();
    }
    this.healthRecordVysetrenieService.clearPacientDetail();
    this.healthRecordVysetrenieService.clearPriznakyCache();
  }
 
  ngOnInit(): void {
    this.loadCurrentHealthRecordFromResolver();
    this.downloadAttachemtByVysetrenie();
  }

  private loadCurrentHealthRecordFromResolver() {
    this.healthRecord$ = this.route.data.pipe(
      map((data) => {
        this.healthRecordVysetrenieService.setPacientDetail(((data.healthRecord) as ZdravotnaKarta)?.pacientDetail);
        return data.healthRecord;
      })
    );
  }

  private downloadAttachemtByVysetrenie() {
    this.subs.sink = this.healthRecordVysetrenieService.downloadAttacmentStarted$.pipe(
      switchMap((idVysetrenie: number) => {
        return this.healthRecord$.pipe(
          map((karta: ZdravotnaKarta) => {
            var vysetreniePacient = karta.vykVysetrenia.find(v => v.idVysetrenie === idVysetrenie);
            const attachementData: HealthRecordVysetrenieAttachmentZip = 
              {
                  vysetrenie: vysetreniePacient,
                  hesloPacient: karta.pacientDetail.bid,
                  menoPacient: karta.pacientDetail.fullName
              };
            return attachementData;
          })
        )
      })
    ).subscribe((attachementData: HealthRecordVysetrenieAttachmentZip) => {
      this.downloadZip(attachementData);
    })
  }

  private downloadZip(attachementData: HealthRecordVysetrenieAttachmentZip) {
    if (attachementData.vysetrenie.priloha?.length > 0) {
      moment.locale('sk');
      const vysetrenieDate: Date =  new Date(attachementData.vysetrenie.datumVys);
      var zip = new JSZip();
      var imgFolder = zip.folder(`${attachementData.vysetrenie.typVysetreniaNazov}`);
        imgFolder.file(
          `${attachementData.menoPacient}-${(moment(vysetrenieDate)).format('DD-MMMM-YYYY(HH:mm:ss)')}.jpg`,
          attachementData.vysetrenie.priloha,
          { base64: true}
        );

        zip.generateAsync({ type: "blob"})
          .then((attachemntContent) => {
            FileSaver.saveAs(
              attachemntContent,
              `${attachementData.vysetrenie.typVysetreniaNazov}-${moment(vysetrenieDate).format('DD-MMMM-YYYY')}.zip`
            );
          })
      }
  }
}
