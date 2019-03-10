import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VentComponent } from './vent.component';

describe('VentComponent', () => {
  let component: VentComponent;
  let fixture: ComponentFixture<VentComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VentComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
