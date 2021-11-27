import { Component, Input, OnInit } from '@angular/core';
import { PacientCard } from 'src/app/models/pacientCard';

@Component({
  selector: 'app-pacient-card',
  templateUrl: './pacient-card.component.html',
  styleUrls: ['./pacient-card.component.css']
})
export class PacientCardComponent implements OnInit {
  @Input() patient: PacientCard;

  constructor() { }

  ngOnInit(): void {
  }

}
