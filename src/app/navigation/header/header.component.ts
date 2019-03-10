import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  links = ['vent', 'gripes'];
  activeLink = window.location.pathname.replace('/', '');

  constructor(private _route: ActivatedRoute) {
    console.log(_route.component);
   }

  ngOnInit() {
  }

}
