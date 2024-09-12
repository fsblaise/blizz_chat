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

@WebSocketGateway({ cors: { origin: '*', }, transports: ['websocket'], })
export class MessagesGateway {
  @WebSocketServer() server: Server;
  private onlineUsers: Map<string, string> = new Map(); // userId: socketId

  constructor(
    private readonly messagesService: MessagesService,
    private jwtService: JwtService,
  ) { }

  async handleConnection(client: Socket) {    
    console.log('Client connected');
    
    try {
      const token = client.handshake.query.token as string;
      // console.log(token);
      console.log(client.handshake);
      
      const user = this.jwtService.verify(token);
      console.log(user);
      const userId = user.sub;
      this.onlineUsers.set(userId, client.id); // client.id = socketId
      this.broadcastStatus(userId, 'online');
      // sync messages
      await this.sendOfflineMessages(userId, client.id);
    } catch (error) {
      client.disconnect();
      throw new WsException('Invalid token');
    }
    console.log(JSON.stringify(Array.from(this.onlineUsers)));
  }

  handleDisconnect(client: Socket) {
    const userId = Array.from(this.onlineUsers).find(([_, socketId]) => socketId === client.id)?.[0];
    if (userId) {
      this.onlineUsers.delete(userId);
      this.broadcastStatus(userId, 'offline');
    }
  }

  @SubscribeMessage('createMessage')
  async create(@MessageBody() createMessageDto: CreateMessageDto) {
    // iterate through all recipients
    createMessageDto.to.forEach(async recipientId => {
      const recipientSocketId = this.onlineUsers.get(recipientId);
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
          recipientId,
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

  private async sendOfflineMessages(userId: string, socketId: string) {
    const messages = await this.messagesService.findMessagesForUser(userId);
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

  private broadcastStatus(userId: string, status: string) {
    this.onlineUsers.forEach((socketId, id) => {
      if (id !== userId) {
        this.server.to(socketId).emit('userStatus', { userId, status });
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
