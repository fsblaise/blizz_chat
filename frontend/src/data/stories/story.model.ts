export interface Story {
  caption: string;
  extension: string;
  imgUrl: string;
  timestamp: string;
  sender: User;
}

export interface User {
  fullName: string;
  email: string;
}