import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { ZdravotnaKarta } from 'src/app/models/pacient/zdravotnaKarta/zdravotnaKarta';

@Component({
  selector: 'app-health-record-shell',
  templateUrl: './health-record-shell.component.html',
  styleUrls: ['./health-record-shell.component.css']
})
export class HealthRecordShellComponent implements OnInit {
  healthRecord$: Observable<ZdravotnaKarta>;

  constructor(
    private route: ActivatedRoute) {
    this.loadCurrentHealthRecordFromResolver();
   }
 
  ngOnInit(): void {
    
  }

  private loadCurrentHealthRecordFromResolver() {
    this.healthRecord$ = this.route.data.pipe(
      map((data) => {
        return data.healthRecord;
      })
    );
  }
}
