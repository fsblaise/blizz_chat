import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { map, take } from 'rxjs/operators';
import { AuthService } from '../services/auth.service';
import { async, firstValueFrom } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private authService: AuthService, private router: Router) {}

  canActivate() {
    return firstValueFrom(this.authService.user$).then(user => {
      if (user) {
        return true;
      } else {
        this.router.navigate(['/login']);
        return false;
      }
    });
  }
}