import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GripesComponent } from './gripes.component';

describe('GripesComponent', () => {
  let component: GripesComponent;
  let fixture: ComponentFixture<GripesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GripesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GripesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
