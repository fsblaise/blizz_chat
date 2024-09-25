import {
  WebSocketGateway,
  SubscribeMessage,
  MessageBody,
  WebSocketServer,
  WsException,
  WsResponse,
  ConnectedSocket,
} from '@nestjs/websockets';
import { MessagesService } from './messages.service';
import { CreateMessageDto } from './dto/create-message.dto';
import { Server, Socket } from 'socket.io';
import { from, map, Observable, timestamp } from 'rxjs';
import { JwtService } from '@nestjs/jwt';
import { OnlineUsersService } from './online_users.service';
import { AuthGuard } from 'src/shared/guards/auth.guard';
import { Status } from './dto/status.dto';

@WebSocketGateway({ cors: { origin: '*', }, transports: ['websocket'], })
export class MessagesGateway {
  @WebSocketServer() server: Server;

  constructor(
    private readonly messagesService: MessagesService,
    private jwtService: JwtService,
    private onlineUsersService: OnlineUsersService,
  ) { }

  async handleConnection(@ConnectedSocket() client: Socket) {    
    console.log('Client connected');
    
    try {      
      const token = AuthGuard.extractTokenFromHeader(client.handshake.headers.authorization);

      if (!token) {
        throw new WsException('Invalid token');
      }
      console.log(client.handshake);
      
      const user = this.jwtService.verify(token);
      console.log(user);
      const email = user.email;
      this.onlineUsersService.addUser(email, client.id); // client.id = socketId
      this.broadcastStatus(email, 'online');
      // sync messages
      await this.sendOfflineMessages(email, client.id);
    } catch (error) {
      client.disconnect(true);
      throw new WsException('Invalid token');
    }
    console.log(JSON.stringify(Array.from(this.onlineUsersService.getOnlineUsers())));
  }

  handleDisconnect(@ConnectedSocket() client: Socket) {
    console.log('Client disconnected');
    const token = AuthGuard.extractTokenFromHeader(client.handshake.headers.authorization);
    try {
      const user = this.jwtService.verify(token);
      const email = user.email;

      const socketId = this.onlineUsersService.getUserSocketId(email);

      this.server.sockets.sockets.get(socketId)?.disconnect(true); // Disconnect the old socket

      this.onlineUsersService.removeUser(email);
      console.log(JSON.stringify(Array.from(this.onlineUsersService.getOnlineUsers())));
      this.broadcastStatus(email, 'offline');
    } catch(e) {
      console.error('Error during disconnect:', e);
    } finally {
      client.disconnect(true);
    }
  }

  // @SubscribeMessage('status')
  // async status(@MessageBody() status: Status, @ConnectedSocket() client: Socket) {
  //   try {
  //     const token = AuthGuard.extractTokenFromHeader(client.handshake.headers.authorization);

  //     if (!token) {
  //       throw new WsException('Invalid token');
  //     }

  //     const user = this.jwtService.verify(token);

  //     console.log(user);
  //     console.log(status);

  //     if (user.email !== status.email) {
  //       throw new WsException('Unauthorized');
  //     }

  //     return this.onlineUsersService.isUserOnline(email);
  //   } catch (error) {
  //     throw new WsException('Invalid token');
  //   }
  // }

  @SubscribeMessage('createMessage')
  async create(@MessageBody() createMessageDto: CreateMessageDto) {
    // iterate through all recipients
    console.log(`Message: ${createMessageDto.message}`);
    
    createMessageDto.to.forEach(async recipientEmail => {
      const recipientSocketId = this.onlineUsersService.getUserSocketId(recipientEmail);
      if (recipientSocketId) {
        this.server.to(recipientSocketId).emit('receiveMessage', {
          id: createMessageDto.id,
          from: createMessageDto.from,
          to: recipientEmail,
          message: createMessageDto.message,
          messageType: createMessageDto.messageType,
          timestamp: createMessageDto.timestamp,
          chatId: createMessageDto.chatId
        });
      } else {
        // Add message to queue if recipient is offline
        await this.messagesService.create(
          createMessageDto.id,
          createMessageDto.from,
          recipientEmail,
          createMessageDto.message,
          createMessageDto.messageType,
          createMessageDto.timestamp,
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
        id: message._id,
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
