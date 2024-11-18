import { Component, inject, model, signal } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import {
  MatDialogRef,
  MatDialogModule,
  MAT_DIALOG_DATA,
} from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatTooltipModule } from '@angular/material/tooltip';

export interface ConfirmData {
  message: string;
  confirm: boolean;
}

@Component({
  selector: 'app-confirm.dialog',
  standalone: true,
  imports: [MatDialogModule, MatFormFieldModule, FormsModule, MatInputModule, MatTooltipModule, ReactiveFormsModule],
  templateUrl: './confirm-dialog.component.html',
  styleUrl: './confirm-dialog.component.css'
})
export class ConfirmDialogComponent {
  readonly dialogRef = inject(MatDialogRef<ConfirmDialogComponent>);
  readonly data = inject<{message: string}>(MAT_DIALOG_DATA);
  private confirm = signal(false);
  readonly returnModel = model(this.confirm());

  onConfirm(): void {
    this.returnModel.set(true);
    this.dialogRef.close(this.returnModel());
  }

  onCancel(): void {
    this.returnModel.set(false);
    this.dialogRef.close(this.returnModel());
  }
}
