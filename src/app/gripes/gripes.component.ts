import { Component, OnInit } from '@angular/core';
import { Gripes } from './gripes';

@Component({
  selector: 'app-gripes',
  templateUrl: './gripes.component.html',
  styleUrls: ['./gripes.component.scss']
})
export class GripesComponent implements OnInit {
  // Need to refactor this to use a mock service.
  gripes = new Gripes().staticGripes;
  constructor() { 
    console.log(this.gripes);
  }

  ngOnInit() {
  }

}
