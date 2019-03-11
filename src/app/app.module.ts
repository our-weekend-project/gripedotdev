import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { PickerModule } from '@ctrl/ngx-emoji-mart';
import {
  MatInputModule,
  MatFormFieldModule,
  MatButtonModule,
  MatTabsModule,
  MatToolbarModule,
  MatCardModule,
  MatListModule,
  MatMenuModule} from '@angular/material';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './navigation/header/header.component';
import { GripesComponent } from './gripes/gripes.component';
import { VentComponent } from './vent/vent.component';
import { FooterComponent } from './navigation/footer/footer.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    GripesComponent,
    VentComponent,
    FooterComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatInputModule,
    MatFormFieldModule,
    MatButtonModule,
    MatTabsModule,
    MatToolbarModule,
    MatCardModule,
    MatListModule,
    MatMenuModule,
    PickerModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
