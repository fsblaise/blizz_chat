import { Module } from '@nestjs/common';
import { MessagesService } from './messages.service';
import { MessagesGateway } from './messages.gateway';
import { MongooseModule } from '@nestjs/mongoose';
import { MessageQueue, MessageQueueSchema } from './schemas/message.schema';
import { OnlineUsersService } from './online_users.service';

@Module({
  imports: [MongooseModule.forFeature([{ name: MessageQueue.name, schema: MessageQueueSchema }])],
  providers: [MessagesGateway, MessagesService, OnlineUsersService],
  exports: [OnlineUsersService]
})
export class MessagesModule { }
