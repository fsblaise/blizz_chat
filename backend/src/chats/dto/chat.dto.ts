export class ChatDto {
  _id: String;
  title: string;
  lastMessage: string;
  participants: ParticipantDto[];
  // not part of the schema, only of the dto
  isChatOnline: boolean;
}

export class ParticipantDto {
  nickname: string;
  fullName: string;
  email: string;
  // not part of the schema, only of the dto
  isOnline: boolean;
}