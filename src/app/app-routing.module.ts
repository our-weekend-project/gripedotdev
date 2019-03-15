import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppComponent } from './app.component';
import { GripesComponent } from './gripes/gripes.component';
import { VentComponent } from './vent/vent.component';

const routes: Routes = [
  { path: 'vent', component: VentComponent },
  { path: 'gripes', component: GripesComponent },
  { path: '', redirectTo: '/vent', pathMatch: 'full'}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
