import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-portfolio',
  templateUrl: './portfolio.component.html',
  styleUrls: ['./portfolio.component.css']
})
export class PortfolioComponent implements OnInit {

  equifaxImages: any[];

  constructor() {
    this.equifaxImages = [];
    this.equifaxImages.push({
      source: 'assets/img/equifax/FACTA-mobile.png', 
      thumbnail: 'assets/img/equifax/thumb_FACTA-mobile.jpg', 
      title: 'FACTA mobile'
    });
   }

  ngOnInit() {
  }

}
