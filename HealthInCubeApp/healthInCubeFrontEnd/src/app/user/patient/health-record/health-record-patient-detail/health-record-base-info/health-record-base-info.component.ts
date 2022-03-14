import { Directive } from '@angular/core';
import { ClipboardService } from 'ngx-clipboard';
import { ToastrService } from 'ngx-toastr';
import { faCopy } from '@fortawesome/free-solid-svg-icons';


@Directive()
export abstract class HealthRecordBaseInfo{
  imgCopy = faCopy;

  constructor(
    public toastr: ToastrService,
    public clipboardApi: ClipboardService
  ) { }


  copyEmialToClipboard(email: string) {
    this.clipboardApi.copyFromContent(email);
    this.toastr.info('Email skopírovaný');
  }
}

