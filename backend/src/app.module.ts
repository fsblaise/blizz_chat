import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { ChatsModule } from './chats/chats.module';
import { MessagesModule } from './messages/messages.module';
import { StoriesModule } from './stories/stories.module';

@Module({
  imports: [UsersModule, ChatsModule, MessagesModule, StoriesModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
