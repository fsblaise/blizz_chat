export class ChatDto {
  title: string;
  lastMessage: string;
  participants: ParticipantDto[];
}

export class ParticipantDto {
  nickname: string;
  fullName: string;
  email: string;
}