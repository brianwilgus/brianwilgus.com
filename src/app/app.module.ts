import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { 
  MdButtonModule, 
  MdCheckboxModule, 
  MdIconModule,
  MdToolbarModule 
} from '@angular/material';

import { WelcomeComponent } from './welcome/welcome.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';

import 'hammerjs';

import { Routing } from './app.routing';

@NgModule({
  declarations: [
    AppComponent,
    WelcomeComponent,
    PageNotFoundComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    Routing,
    MdButtonModule,
    MdCheckboxModule,
    MdIconModule,
    MdToolbarModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})

export class AppModule { }
