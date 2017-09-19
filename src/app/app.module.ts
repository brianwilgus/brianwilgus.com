import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { MaterialModule } from '@angular/material';

import { WelcomeComponent } from './welcome/welcome.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { SkillsComponent } from './skills/skills.component';
import { WorkHistoryComponent } from './work-history/work-history.component';
import { ContactComponent } from './contact/contact.component';
import { PortfolioComponent } from './portfolio/portfolio.component';

import 'hammerjs';

import { Routing } from './app.routing';

import { NgBoxModule } from 'ngbox/ngbox.module';
import { NgBoxService } from 'ngbox/ngbox.service';
import { CommonModule } from '@angular/common';

@NgModule({
  declarations: [
    AppComponent,
    WelcomeComponent,
    PageNotFoundComponent,
    SkillsComponent,
    WorkHistoryComponent,
    ContactComponent,
    PortfolioComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    Routing,
    MaterialModule,
    BrowserAnimationsModule,
    NgBoxModule,
    CommonModule
  ],
  providers: [NgBoxService],
  bootstrap: [AppComponent]
})

export class AppModule { }
