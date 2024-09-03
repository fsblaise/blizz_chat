import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateChatDto } from './dto/create-chat.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Chat, Participant } from './schemas/chat.schema';
import { Model } from 'mongoose';
import { ChatDto } from './dto/chat.dto';

@Injectable()
export class ChatsService {

  constructor(@InjectModel(Chat.name) private chatModel: Model<Chat>) {}

  async create(createChatDto: CreateChatDto) {
    const participantsNames = createChatDto.participants
      .map(participant => participant.fullName)
      .join(', ');

    const participants: Participant[]  = createChatDto.participants.map(participant => ({
      email: participant.email,
      fullName: participant.fullName,
      nickname: participant.fullName,
    }));

    const chatEntity = new this.chatModel({
      title: participantsNames,
      lastMessage: null,
      participants: participants,
    });
    const entity = await chatEntity.save();
    console.log(entity);
    
    return entity;
  }

  async findAll(email: string) : Promise<Chat[]> {
    return this.chatModel.find({ 'participants.email': email }).exec();
  }

  findOne(id: number) {
    return this.chatModel.findById(id);
  }

  async update(id: string, body: Chat, email: string) : Promise<Chat[]> {
    if (body.participants.length < 1) {
      this.remove(id);
    }

    const updatedChat = await this.chatModel.findByIdAndUpdate(id, body, {
      new: true,
    });

    if (!updatedChat) {
      throw new NotFoundException(`Chat with id ${id} not found`);
    }

    return this.findAll(email);
  }

  remove(id: string) {
    return this.chatModel.findByIdAndDelete(id);
  }
}
