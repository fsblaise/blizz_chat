import { Component, inject, model, OnInit } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import {
  MatDialogRef,
  MatDialogModule,
  MAT_DIALOG_DATA,
} from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatTooltipModule } from '@angular/material/tooltip';
import { getMemberForm } from '../../../forms/member.form';
import { MatSelectModule } from '@angular/material/select';
import { Member } from '../../../models/company.model';

@Component({
  selector: 'app-add.member.dialog',
  standalone: true,
  imports: [MatDialogModule, MatFormFieldModule, FormsModule, MatInputModule, MatTooltipModule, ReactiveFormsModule, MatSelectModule],
  templateUrl: './add-member-dialog.component.html',
  styleUrl: './add-member-dialog.component.css'
})
export class AddMemberDialogComponent implements OnInit {
  readonly dialogRef = inject(MatDialogRef<AddMemberDialogComponent>);
  readonly data = inject<Member>(MAT_DIALOG_DATA);
  readonly returnModel = model(this.data);
  memberForm = getMemberForm();

  ngOnInit(): void {
    this.memberForm.setValue({
      name: this.data.fullName,
      email: this.data.email,
      role: this.data.role,
    });
  }

  public get name() {
    return this.memberForm.get('name');
  }

  public get email() {
    return this.memberForm.get('email');
  }

  public get role() {
    return this.memberForm.get('role');
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

  submit() {
    if (this.memberForm.valid) {
      this.data.email = this.email!.value!;
      this.data.fullName = this.name!.value!;
      this.data.role = this.role!.value!;
      this.dialogRef.close(this.returnModel());
    }
  }
}
