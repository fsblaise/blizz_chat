export class CreateChatDto {
  participants: CreateParticipantDto[]
}

class CreateParticipantDto {
  user: CreateUserDto;
}

class CreateUserDto {
  fullName: string;
  email: string;
}