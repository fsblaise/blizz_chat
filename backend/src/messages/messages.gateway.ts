import {
  WebSocketGateway,
  SubscribeMessage,
  MessageBody,
  WebSocketServer,
  WsException,
  WsResponse,
} from '@nestjs/websockets';
import { MessagesService } from './messages.service';
import { CreateMessageDto } from './dto/create-message.dto';
import { Server, Socket } from 'socket.io';
import { from, map, Observable, timestamp } from 'rxjs';
import { JwtService } from '@nestjs/jwt';
import { OnlineUsersService } from './online_users.service';

@WebSocketGateway({ cors: { origin: '*', }, transports: ['websocket'], })
export class MessagesGateway {
  @WebSocketServer() server: Server;

  constructor(
    private readonly messagesService: MessagesService,
    private jwtService: JwtService,
    private onlineUsersService: OnlineUsersService,
  ) { }

  async handleConnection(client: Socket) {    
    console.log('Client connected');
    
    try {
      const token = client.handshake.query.token as string;
      // console.log(token);
      console.log(client.handshake);
      
      const user = this.jwtService.verify(token);
      console.log(user);
      const email = user.email;
      this.onlineUsersService.addUser(email, client.id); // client.id = socketId
      this.broadcastStatus(email, 'online');
      // sync messages
      await this.sendOfflineMessages(email, client.id);
    } catch (error) {
      client.disconnect();
      throw new WsException('Invalid token');
    }
    console.log(JSON.stringify(Array.from(this.onlineUsersService.getOnlineUsers())));
  }

  handleDisconnect(client: Socket) {
    console.log('Client disconnected');
    const email = this.onlineUsersService.removeUser(client.id);
    if (email) {
      this.broadcastStatus(email, 'offline');
    }
  }

  @SubscribeMessage('createMessage')
  async create(@MessageBody() createMessageDto: CreateMessageDto) {
    // iterate through all recipients
    createMessageDto.to.forEach(async recipientEmail => {
      const recipientSocketId = this.onlineUsersService.getUserSocketId(recipientEmail);
      const timestamp = new Date().toISOString();
      if (recipientSocketId) {
        this.server.to(recipientSocketId).emit('receiveMessage', {
          from: createMessageDto.from,
          to: createMessageDto.to,
          message: createMessageDto.message,
          timestamp: timestamp,
          chatId: createMessageDto.chatId
        });
      } else {
        // Add message to queue if recipient is offline
        await this.messagesService.create(
          createMessageDto.from,
          recipientEmail,
          createMessageDto.message,
          timestamp,
          createMessageDto.chatId,
        );
      }
    });
  }

  // Not sure about these functions

  // @SubscribeMessage('findAllMessages')
  // findAll() {
  //   return this.messagesService.findAll();
  // }

  // @SubscribeMessage('findOneMessage')
  // findOne(@MessageBody() id: number) {
  //   return this.messagesService.findOne(id);
  // }

  // @SubscribeMessage('updateMessage')
  // update(@MessageBody() updateMessageDto: UpdateMessageDto) {
  //   return this.messagesService.update(updateMessageDto.id, updateMessageDto);
  // }

  private async sendOfflineMessages(email: string, socketId: string) {
    const messages = await this.messagesService.findMessagesForUser(email);
    messages.forEach(async message => {
      this.server.to(socketId).emit('receiveMessage', {
        from: message.from,
        to: message.to,
        message: message.message,
        timestamp: message.timestamp,
        chatId: message.chatId
      });
      await this.messagesService.remove(message._id);
    });
  }

  private broadcastStatus(userEmail: string, status: string) {
    this.onlineUsersService.getOnlineUsers().forEach((socketId, email) => {
      if (email !== userEmail) {
        this.server.to(socketId).emit('userStatus', { userEmail, status });
      }
    });
  }

  // test
  @SubscribeMessage('events')
  findAll(@MessageBody() data: any): Observable<WsResponse<number>> {
    return from([1, 2, 3]).pipe(map(item => ({ event: 'events', data: item })));
  }

  @SubscribeMessage('identity')
  async identity(@MessageBody() data: number): Promise<number> {
    return data;
  }
}
