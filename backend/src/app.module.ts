import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { ChatsModule } from './chats/chats.module';
import { MessagesModule } from './messages/messages.module';
import { StoriesModule } from './stories/stories.module';
import { MongooseModule } from '@nestjs/mongoose';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { KeysModule } from './keys/keys.module';
import { CompaniesModule } from './companies/companies.module';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';

const ENV = process.env.NODE_ENV;

@Module({
  imports: [
    ConfigModule.forRoot({
      envFilePath: !ENV ? '.env' : `.env.dev`,
    }),
    MongooseModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: async (configService: ConfigService) => {
        const dbUri = configService.get<string>('DB_URI');
        console.log(`Connecting to database: ${process.env.DB_URI}`);
        return {
          dbName: 'BlizzChat',
          uri: dbUri,
        };
      },
      inject: [ConfigService]
    }),
    ServeStaticModule.forRoot({
      rootPath: join(__dirname, 'uploads'),
      serveRoot: '/uploads/',
    }),
    UsersModule,
    ChatsModule,
    MessagesModule,
    StoriesModule,
    KeysModule,
    CompaniesModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
