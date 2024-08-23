import { IsString } from 'class-validator';

export class CreateContactDto {
  @IsString()
  fullName: string;

  @IsString()
  email: string;
}