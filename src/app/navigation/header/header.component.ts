import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  links = ['vent', 'gripes'];
  activeLink: string;

  constructor() {
   }

  ngOnInit() {
    this.activeLink = window.location.pathname.replace('/', '');
    if (this.activeLink === '') {
      this.activeLink = 'vent';
    }
  }

}
