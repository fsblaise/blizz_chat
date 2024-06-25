export class MessageDto {
  sender: UserDto;
  message: string;
  timestamp: string;
}

export class UserDto {
  nickname: string;
  fullName: string;
  email: string;
}