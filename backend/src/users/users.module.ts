import { Module } from '@nestjs/common';
import { UsersService } from './users.service';
import { UsersController } from './users.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { User, UserSchema } from './schemas/user.schema';
import { JwtModule } from '@nestjs/jwt';
import { ConfigModule, ConfigService } from '@nestjs/config';

@Module({
  imports: [
    MongooseModule.forFeature([{ name: User.name, schema: UserSchema}]),
    JwtModule.registerAsync({
      imports: [ConfigModule],
      useFactory: async (configService: ConfigService) => {
        const jwt = configService.get<string>('JWT_SECRET');
        console.log(jwt);
        return {
          global: true,
          secret: jwt,
          signOptions: { expiresIn: '1d' }
        }
      },
      inject: [ConfigService],
      global: true
    })
  ],
  controllers: [UsersController],
  providers: [UsersService],
})
export class UsersModule {}
