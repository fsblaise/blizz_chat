import { Component, inject, model } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import {
  MatDialogRef,
  MatDialogModule,
  MAT_DIALOG_DATA,
} from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatTooltipModule } from '@angular/material/tooltip';
import { getCompanyForm } from '../../../forms/company.form';

export interface CompanyDetails {
  name: string;
  apiUrl: string;
}

@Component({
  selector: 'app-company.form.dialog',
  standalone: true,
  imports: [MatDialogModule, MatFormFieldModule, FormsModule, MatInputModule, MatTooltipModule, ReactiveFormsModule],
  templateUrl: './company-form-dialog.component.html',
  styleUrl: './company-form-dialog.component.css'
})
export class CompanyFormDialogComponent {
  readonly dialogRef = inject(MatDialogRef<CompanyFormDialogComponent>);
  readonly data = inject<CompanyDetails>(MAT_DIALOG_DATA);
  readonly returnModel = model(this.data);
  companyForm = getCompanyForm();

  public get name() {
    return this.companyForm.get('name');
  }

  public get apiUrl() {
    return this.companyForm.get('apiUrl');
  }

  onNoClick(): void {
    this.dialogRef.close();
  }
}
