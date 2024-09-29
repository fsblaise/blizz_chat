export class CreateDistributionKeyDto {
  key: Buffer;
  senderEmail: string;
  groupId: string;
  messageType: number;
  to: string[];
}