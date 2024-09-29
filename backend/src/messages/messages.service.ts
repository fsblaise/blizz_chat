import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { MessageQueue } from './schemas/message.schema';
import { DistributionKey } from './schemas/distribution-key.schema';

@Injectable()
export class MessagesService {

  constructor(
    @InjectModel('MessageQueue') private messageQueueModel: Model<MessageQueue>,
    @InjectModel('DistributionKey') private distributionKeyModel: Model<DistributionKey>,
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

  // Distribution Key

  async createDistributionKey(key: Buffer, senderEmail: string, groupId: string, messageType: number, to: string): Promise<DistributionKey> {
    const distributionKey = new this.distributionKeyModel({
      key,
      senderEmail,
      groupId,
      messageType,
      to
    });
    return await distributionKey.save();
  }

  async findDistributionKeysForUser(email: string): Promise<DistributionKey[]> {
    return await this.distributionKeyModel.find({ to: email }).exec();
  }

  async removeDistributionKey(distributionKey: DistributionKey): Promise<any> {
    return await this.distributionKeyModel.deleteOne(distributionKey).exec();
  }
}
