import { UserProfileDto } from "./user.dto";

export class SignInUserDto {
  email: string;
  password: string;
}

export class AuthResponseDto {
  token: string;
  user: UserProfileDto;
}
