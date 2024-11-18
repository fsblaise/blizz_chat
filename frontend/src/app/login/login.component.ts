import { Component } from '@angular/core';
import { MatButton } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIcon } from '@angular/material/icon';
import { MatInput } from '@angular/material/input';
import { Router, RouterLink } from '@angular/router';
import { getLogInForm } from '../../shared/forms/login.form';
import { ReactiveFormsModule } from '@angular/forms';
import { AuthService } from '../../shared/services/auth.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [MatCardModule, MatFormFieldModule, MatInput, MatIcon, RouterLink, MatButton, ReactiveFormsModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {
  loginForm = getLogInForm();

  constructor(private router: Router, private auth: AuthService) {}

  public get email() {
    return this.loginForm.get('email');
  }

  public get password() {
    return this.loginForm.get('password');
  }

  login(): void {
    if (this.loginForm.valid) {
      console.log('Login');
      this.auth.login(
        this.email?.value as string, 
        this.password?.value as string, 
      ).subscribe((user) => {
        if (user) {
          this.router.navigateByUrl('/profile');
        } else {
          console.error('Failed to create user');
        }
      });
    }
  }
}
