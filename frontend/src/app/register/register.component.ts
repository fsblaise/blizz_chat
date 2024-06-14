import { Component } from '@angular/core';
import { AbstractControl, ReactiveFormsModule } from '@angular/forms';
import { MatButton } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIcon } from '@angular/material/icon';
import { MatInput } from '@angular/material/input';
import { RouterLink } from '@angular/router';
import { getSignUpForm } from '../../shared/forms/signup.form';
import { NgClass } from '@angular/common';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [MatCardModule, MatFormFieldModule, MatInput, MatIcon, RouterLink, MatButton, ReactiveFormsModule, NgClass],
  templateUrl: './register.component.html',
  styleUrl: './register.component.css',   
})
export class RegisterComponent {
  step = 0;
  signUpForm = getSignUpForm();

  constructor() {}

  public get email() {
    return this.signUpForm.get('email');
  }

  public get password() {
    return this.signUpForm.get('password');
  }

  public get rePassword() {
    return this.signUpForm.get('rePassword');
  }

  isFirstStepValid() {
    return this.email?.valid && this.password?.valid && this.rePassword?.valid && this.password?.value === this.rePassword?.value;
  }

  nextStep() {
    this.step++;
  }

  prevStep() {
    this.step--;
  }
}
