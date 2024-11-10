import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, Req } from '@nestjs/common';
import { ChatsService } from './chats.service';
import { CreateChatDto } from './dto/create-chat.dto';
import { AuthGuard } from 'src/shared/guards/auth.guard';
import { ChatDto } from './dto/chat.dto';
import { Chat } from './schemas/chat.schema';

@Controller('chats')
export class ChatsController {
  constructor(private readonly chatsService: ChatsService) {}

  @Post()
  @UseGuards(AuthGuard)
  create(@Body() createChatDto: CreateChatDto, @Req() request: Request): Promise<ChatDto> {
    console.log(createChatDto.participants);
    const user = request['user'];
    return this.chatsService.create(createChatDto, user.email);
  }

  @Get()
  @UseGuards(AuthGuard)
  findAll(@Req() request: Request): Promise<ChatDto[]> {
    const user = request['user'];
    return this.chatsService.findAll(user.email);
  }

  @Get(':id')
  @UseGuards(AuthGuard)
  findOne(@Param('id') id: string, @Req() request: Request): Promise<ChatDto> {
    const user = request['user'];
    return this.chatsService.findOne(id, user.email);
  }

  @Patch(':id')
  @UseGuards(AuthGuard)
  update(@Param('id') id: string, @Body() body: Chat, @Req() request: Request): Promise<ChatDto[]>{
    const user = request['user'];
    return this.chatsService.update(id, body, user.email);
  }

  @Delete(':id')
  @UseGuards(AuthGuard)
  remove(@Param('id') id: string) {
    return this.chatsService.remove(id);
  }
}
