export class CreateMessageDto {
  to: string[];
  from: string;
  message: string; // encrypted
  chatId: string;
}
