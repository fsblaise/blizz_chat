import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { BehaviorSubject, Observable, catchError, map, of } from 'rxjs';
import { AuthResponseDto, LoginDto, SignupDto } from '../models/user.dtos';
import { User } from '../models/user.model';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  public userSubject: BehaviorSubject<any> = new BehaviorSubject<any>(null);
  public user$: Observable<User> = this.userSubject.asObservable();

  constructor(private http: HttpClient) { }

  signup(email: string, password: string, fullName: string): Observable<User | null> {
    const signupDto: SignupDto = { email, password, fullName };
    return this.http.post(`${environment.API_URL}/users/signUp`, signupDto, { observe: 'response', withCredentials: true }).pipe(
      map((response: any) => {
        if (response.ok && response.body) {
          const authResponseDto = response.body as AuthResponseDto;
          const user = authResponseDto.user;
          this.userSubject.next(user);
          sessionStorage.setItem('user', JSON.stringify(user));
          return user;
        } else {
          throw new Error('Failed to sign up');
        }
      }),
      catchError((error: any) => {
        console.error(error);
        return of(null);
      }),
    );
  }

  login(email: string, password: string): Observable<User | null> {
    const loginDto: LoginDto = { email, password };
    return this.http.post(`${environment.API_URL}/users/signIn`, loginDto, { observe: 'response', withCredentials: true }).pipe(
      map((response: any) => {
        if (response.ok && response.body) {
          const authResponseDto = response.body as AuthResponseDto;
          const user = authResponseDto.user;
          this.userSubject.next(user);
          sessionStorage.setItem('user', JSON.stringify(user));
          return user;
        } else {
          throw new Error('Failed to sign in');
        }
      }),
      catchError((error: any) => {
        console.error(error);
        return of(null);
      }),
    );
  }
}