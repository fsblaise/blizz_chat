import { Injectable } from '@nestjs/common';
import { CreateChatDto } from './dto/create-chat.dto';
import { UpdateChatDto } from './dto/update-chat.dto';
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
    
    return this.convertEntityToChatDto(entity);
  }

  async findAll(email: string) {
    return this.chatModel.find({ 'participants.email': email }).exec();
  }

  findOne(id: number) {
    return this.chatModel.findById(id);
  }

  update(id: number, updateChatDto: UpdateChatDto) {
    return `This action updates a #${id} chat`;
  }

  remove(id: number) {
    return this.chatModel.findByIdAndDelete(id);
  }

  convertEntityToChatDto(chat: Chat): ChatDto {
    return {
      title: chat.title,
      lastMessage: chat.lastMessage,
      participants: chat.participants
    }
  }
}
