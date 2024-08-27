export class CreateChatDto {
  participants: CreateParticipantDto[]
}

class CreateParticipantDto {
  fullName: string;
  email: string;
}