import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateChatDto } from './dto/create-chat.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Chat, Participant } from './schemas/chat.schema';
import { Model } from 'mongoose';
import { ChatDto } from './dto/chat.dto';
import { OnlineUsersService } from 'src/messages/online_users.service';

@Injectable()
export class ChatsService {

  constructor(@InjectModel(Chat.name) private chatModel: Model<Chat>, private onlineUsersService: OnlineUsersService) { }

  async create(createChatDto: CreateChatDto, email: string): Promise<ChatDto> {
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
        await foundChat.save()
        return this.renderChat(foundChat, email);
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
      await chatEntity.save()
      return this.renderChat(chatEntity, email);
    }
  }

  async findAll(email: string): Promise<ChatDto[]> {
    const entities = await this.chatModel.find({ 'participants.email': email }).exec();
    return entities.map(entity => this.renderChat(entity, email));
  }

  async findOne(id: string, email: string): Promise<ChatDto> {
    const entity = await this.chatModel.findById(id).exec();
    return this.renderChat(entity, email);
  }

  async update(id: string, body: Chat, email: string): Promise<ChatDto[]> {
    if (body.participants.length < 1) {
      this.remove(id);
    } else {
      const updatedChat = await this.chatModel.findByIdAndUpdate(id, body, {
        new: true,
      }).exec();
  
      if (!updatedChat) {
        throw new NotFoundException(`Chat with id ${id} not found`);
      }
    }

    return this.findAll(email);
  }

  remove(id: string) {
    return this.chatModel.findByIdAndDelete(id).exec();
  }

  renderChat(chat: Chat, userEmail: string): ChatDto {
    let isChatOnline = false;
    return {
      _id: chat._id.toString(),
      title: chat.title,
      lastMessage: chat.lastMessage,
      participants: chat.participants.map(participant => {
        const isOnline = userEmail != participant.email 
                                ? this.onlineUsersService.isUserOnline(participant.email) 
                                : false;
        if (isOnline) {
          isChatOnline = true;
        }
        return {
          nickname: participant.nickname,
          fullName: participant.fullName,
          email: participant.email,
          isOnline,
        }
      }),
      isChatOnline,
    };
  }
}
