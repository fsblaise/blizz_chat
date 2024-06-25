export class StoryDto {
  caption: string;
  extension: string;
  imgUrl: string;
  timestamp: string;
  sender: UserDto;
}

export class UserDto {
  fullName: string;
  email: string;
}