import { Module } from '@nestjs/common';
import { KeysService } from './keys.service';
import { KeysController } from './keys.controller';
import { Key, KeySchema } from './schemas/key.schema';
import { MongooseModule } from '@nestjs/mongoose';

@Module({
  imports: [MongooseModule.forFeature([{ name: Key.name, schema: KeySchema}])],
  controllers: [KeysController],
  providers: [KeysService],
})
export class KeysModule {}
