import { UserProfileDto } from "./user.dto";

export class SignInUserDto {
  email: string;
  password: string;
}

export class SignInUserResponseDto {
  token: string;
  user: UserProfileDto;
}
