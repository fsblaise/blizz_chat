import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { MessageQueue } from './schemas/message.schema';

@Injectable()
export class MessagesService {

  constructor(
    @InjectModel('MessageQueue') private messageQueueModel: Model<MessageQueue>,
  ) { }

  async create(id: string, from: string, to: string, message: string, messageType: number, timestamp: string, chatId: string): Promise<MessageQueue> {
    const messageQueue = new this.messageQueueModel({
      _id: id,
      from,
      to,
      message,
      messageType,
      timestamp,
      chatId
    });
    return await messageQueue.save();
  }

  async findMessagesForUser(email: string): Promise<MessageQueue[]> {
    return await this.messageQueueModel.find({ to: email }).exec();
  }

  async remove(id: any): Promise<MessageQueue> {
    return await this.messageQueueModel.findByIdAndDelete(id).exec();
  }
}
