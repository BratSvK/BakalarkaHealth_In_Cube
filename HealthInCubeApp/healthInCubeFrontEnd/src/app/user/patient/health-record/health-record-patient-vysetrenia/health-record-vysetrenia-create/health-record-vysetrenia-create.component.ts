import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';

@Component({
  selector: 'app-health-record-vysetrenia-create',
  templateUrl: './health-record-vysetrenia-create.component.html',
  styleUrls: ['./health-record-vysetrenia-create.component.css']
})
export class HealthRecordVysetreniaCreateComponent implements OnInit {
  vysetrenieCreateForm: FormGroup;

  constructor() { }

  ngOnInit(): void {
  }

}
