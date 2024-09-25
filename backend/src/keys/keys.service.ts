import { Injectable } from '@nestjs/common';
import { CreateKeyDto, KeyDto } from './dto/key.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Key } from './schemas/key.schema';
import { Model } from 'mongoose';

@Injectable()
export class KeysService {

  constructor(@InjectModel(Key.name) private keyModel: Model<Key>) { }

  async create(publicKeys: CreateKeyDto, email: string) : Promise<KeyDto> {
    try {
      const existingKey = await this.keyModel.findOne({ email }).exec();
      if (existingKey) {
        await this.keyModel.updateOne({ email }, { ...publicKeys, email }).exec();
        return this.keyModel.findOne({ email }).exec();
      } else {
        const entity = await this.keyModel.create({ ...publicKeys, email });
        return entity;
      }
    } catch(e) {
      console.error('Error creating or updating key:', e);
      throw e;
    }
  }

  async findAll(emails: string[]) : Promise<KeyDto[]> {
    const entities = await Promise.all(emails.map(email => this.keyModel.findOne({ email }).exec()));
    return entities.filter(entity => entity !== null);
  }

  update(id: number, updateKeyDto: KeyDto) {
    return `This action updates a #${id} key`;
  }

  remove(id: number) {
    return `This action removes a #${id} key`;
  }
}
