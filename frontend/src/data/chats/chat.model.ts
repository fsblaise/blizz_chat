export interface Chat {
  title: string;
  lastMessage: string;
  participants: Participant[];
}

export interface Participant {
  user: User;
  nickname: string;
}

export interface User {
  nickname: string;
  fullName: string;
  email: string;
}