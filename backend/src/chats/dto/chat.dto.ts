export class ChatDto {
  title: string;
  lastMessage: string;
  participants: ParticipantDto[];
}

export class ParticipantDto {
  user: UserDto;
}

export class UserDto {
  nickname: string;
  fullName: string;
  email: string;
}