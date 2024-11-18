import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CompanyFormDialogComponent } from './company-form-dialog.component';

describe('CompanyFormDialogComponent', () => {
  let component: CompanyFormDialogComponent;
  let fixture: ComponentFixture<CompanyFormDialogComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CompanyFormDialogComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CompanyFormDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
