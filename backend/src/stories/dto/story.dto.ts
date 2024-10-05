export class StoryDto {
  _id: string;
  caption: string;
  extension: string;
  imgUrl: string;
  timestamp: string;
  email: string;
}

export class CreateStoryDto {
  caption: string;
  email: string;
}