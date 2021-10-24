import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-ziadanky',
  templateUrl: './ziadanky.component.html',
  styleUrls: ['./ziadanky.component.css']
})
export class ZiadankyComponent implements OnInit {

  requests: [] = [];
  constructor() { }

  ngOnInit(): void {
  }

}
