import { Module } from '@nestjs/common';
import { ChatsService } from './chats.service';
import { ChatsController } from './chats.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { Chat, ChatSchema } from './schemas/chat.schema';
import { MessagesModule } from 'src/messages/messages.module';

@Module({
  imports: [MongooseModule.forFeature([{ name: Chat.name, schema: ChatSchema}]), MessagesModule],
  controllers: [ChatsController],
  providers: [ChatsService],
})
export class ChatsModule {}
