export class CreateMessageDto {
  id: string;
  to: string[];
  from: string;
  message: string; // encrypted
  messageType: number; // encryption type
  chatId: string;
  timestamp: string;
}
