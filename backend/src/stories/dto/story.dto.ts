export class StoryDto {
  _id: string;
  caption: string;
  extension: string;
  imgUrl: string;
  timestamp: string;
  email: string;
  fullName: string;
}

export class CreateStoryDto {
  caption: string;
  email: string;
  fullName: string;
}

export class CreateStoryDtoWrapper {
  createStoryDto: CreateStoryDto;
}