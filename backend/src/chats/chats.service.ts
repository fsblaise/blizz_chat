import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateChatDto } from './dto/create-chat.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Chat, Participant } from './schemas/chat.schema';
import { Model } from 'mongoose';

@Injectable()
export class ChatsService {

  constructor(@InjectModel(Chat.name) private chatModel: Model<Chat>) { }

  async create(createChatDto: CreateChatDto, email: string): Promise<Chat> {
    const participantsNames = createChatDto.participants
      .map(participant => participant.fullName)
      .join(', ');

    const participants: Participant[] = createChatDto.participants.map(participant => ({
      email: participant.email,
      fullName: participant.fullName,
      nickname: participant.fullName,
    })).sort((a, b) => a.email.localeCompare(b.email));

    const foundChats = await this.chatModel.find({
      originalParticipants: {
        $all: participants.map(participant => ({
          $elemMatch: { email: participant.email, fullName: participant.fullName, nickname: participant.nickname }
        }))
      }
    }).exec();
    const foundChat = foundChats[0];

    console.log(foundChats);

    // We don't let people create chats with the same original participants
    if (foundChat) {
      console.log('foundChat');

      if (foundChat.participants.find(participant => participant.email === email)) {
        // The chat already exists and the user is part of it
        // This is a no-op
        // Even if we would create a chat here, it would throw an error
        throw new ConflictException('Chat already exists, with the user being part of it');
      } else {
        // The chat already exists, but the user is not part of it
        // Add the user to the chat and save
        foundChat.participants = participants;
        return await foundChat.save();
      }
    } else {
      console.log('not foundChat');

      // The chat does not exist
      // Create a new chat and save
      const chatEntity = new this.chatModel({
        title: participantsNames,
        lastMessage: null,
        isGroupChat: participants.length > 2,
        participants: participants,
        originalParticipants: participants,
      });
      // const entity = await chatEntity.save();
      // console.log(entity);

      return await chatEntity.save();;
    }
  }

  async findAll(email: string): Promise<Chat[]> {
    return this.chatModel.find({ 'participants.email': email }).exec();
  }

  findOne(id: number) {
    return this.chatModel.findById(id);
  }

  async update(id: string, body: Chat, email: string): Promise<Chat[]> {
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
