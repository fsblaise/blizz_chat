import { IsString } from 'class-validator';

export class CreateContactDto {
  @IsString()
  fullName: string;

  @IsString()
  email: string;
}

export class UpdateContactDto {
  @IsString()
  fullName: string;

  @IsString()
  nickname: string;

  @IsString()
  email: string;
}