import { animate, keyframes, style, transition, trigger } from '@angular/animations';
import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { faDownload } from '@fortawesome/free-solid-svg-icons';


@Component({
  selector: 'app-vysetrenie-download-attachment',
  templateUrl: './vysetrenie-download-attachment.component.html',
  styleUrls: ['./vysetrenie-download-attachment.component.css'],
  animations: [
    trigger('dowloadFade', [
      transition('void => *', [
        animate(1000, keyframes([
          style({
            opacity: 1
          }),
          style({
            opacity: 0
          })
        ]))
      ])
    ])
  ]
})
export class VysetrenieDownloadAttachmentComponent implements OnInit {
  @Output() downloadStarted: EventEmitter<boolean> = new EventEmitter<boolean>();

  downloadIcon = faDownload;

  constructor() { }

  ngOnInit(): void {
  }

  downloadAttachemnt() {
    this.downloadStarted.emit(true);
  }
}
