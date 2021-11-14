import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-user-not-activated-warning',
  templateUrl: './user-not-activated-warning.component.html',
  styleUrls: ['./user-not-activated-warning.component.css']
})
export class UserNotActivatedWarningComponent implements OnInit {

  dismissible = true;
  constructor() { }

  ngOnInit(): void {
  }


}
  


