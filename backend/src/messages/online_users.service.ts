import { Injectable } from '@nestjs/common';

@Injectable()
export class OnlineUsersService {
  private onlineUsers: Map<string, string> = new Map(); // email: socketId

  addUser(email: string, socketId: string) {
    this.onlineUsers.set(email, socketId);
  }

  removeUser(socketId: string) {
    const email = Array.from(this.onlineUsers).find(([_, id]) => id === socketId)?.[0];
    if (email) {
      this.onlineUsers.delete(email);
      return email;
    }
    return null;
  }

  getUserSocketId(email: string): string | undefined {
    return this.onlineUsers.get(email);
  }

  isUserOnline(email: string): boolean {
    return this.onlineUsers.has(email);
  }

  getOnlineUsers(): Map<string, string> {
    return this.onlineUsers;
  }
}