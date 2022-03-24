import { Component, Input, OnInit } from '@angular/core';
import { faCapsules } from '@fortawesome/free-solid-svg-icons';
import { Balenie } from 'src/app/models/pacient/zdravotnaKarta/zapChoroby/liek/balenie/balenie';

@Component({
  selector: 'app-vysetrenia-recept-liek-item',
  templateUrl: './vysetrenia-recept-liek-item.component.html',
  styleUrls: ['./vysetrenia-recept-liek-item.component.css']
})
export class VysetreniaReceptLiekItemComponent implements OnInit {
  @Input() balenie: Balenie;

  liekIcon = faCapsules;

  constructor() { }

  ngOnInit(): void {
  }

}
