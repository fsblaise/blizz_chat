export interface Message {
  sender: User;
  message: string;
  timestamp: string;
}

export interface User {
  nickname: string;
  fullName: string;
  email: string;
}