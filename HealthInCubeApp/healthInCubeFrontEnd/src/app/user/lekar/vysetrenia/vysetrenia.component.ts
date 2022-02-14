import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { LekarService } from 'src/app/_service/lekar.service';

@Component({
  selector: 'app-vysetrenia',
  templateUrl: './vysetrenia.component.html',
  styleUrls: ['./vysetrenia.component.css']
})
export class VysetreniaComponent implements OnInit {
  loginDoctorId$: Observable<number>;

  constructor(private lekarService: LekarService) { }

  ngOnInit(): void {
    this.loginDoctorId$ = this.lekarService.getLoginDoctorId$();
  }

}
