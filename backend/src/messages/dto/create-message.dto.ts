export class CreateMessageDto {
  id: string;
  to: string[];
  from: string;
  message: string; // encrypted
  chatId: string;
  timestamp: string;
}
