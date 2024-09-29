import { Module } from '@nestjs/common';
import { MessagesService } from './messages.service';
import { MessagesGateway } from './messages.gateway';
import { MongooseModule } from '@nestjs/mongoose';
import { MessageQueue, MessageQueueSchema } from './schemas/message.schema';
import { OnlineUsersService } from './online_users.service';
import { DistributionKey, DistributionKeySchema } from './schemas/distribution-key.schema';

@Module({
  imports: [
    MongooseModule.forFeature([{ name: MessageQueue.name, schema: MessageQueueSchema }]),
    MongooseModule.forFeature([{ name: DistributionKey.name, schema: DistributionKeySchema }])
  ],
  providers: [MessagesGateway, MessagesService, OnlineUsersService],
  exports: [OnlineUsersService]
})
export class MessagesModule { }
