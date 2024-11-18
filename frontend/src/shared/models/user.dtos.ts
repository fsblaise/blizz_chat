import { User } from "./user.model";

export interface LoginDto {
  email: string,
  password: string,
}

export interface SignupDto {
  email: string,
  password: string,
  fullName: string,
}

export interface AuthResponseDto {
  token: string,
  user: User,
}