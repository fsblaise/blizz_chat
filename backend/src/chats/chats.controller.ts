import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, Req } from '@nestjs/common';
import { ChatsService } from './chats.service';
import { CreateChatDto } from './dto/create-chat.dto';
import { UpdateChatDto } from './dto/update-chat.dto';
import { AuthGuard } from 'src/shared/guards/auth.guard';
import { ChatDto } from './dto/chat.dto';

@Controller('chats')
export class ChatsController {
  constructor(private readonly chatsService: ChatsService) {}

  @Post()
  @UseGuards(AuthGuard)
  create(@Body() createChatDto: CreateChatDto): Promise<ChatDto> {
    console.log(createChatDto.participants);
    return this.chatsService.create(createChatDto);
  }

  @Get()
  @UseGuards(AuthGuard)
  findAll(@Req() request: Request) {
    const user = request['user'];
    return this.chatsService.findAll(user.email);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.chatsService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateChatDto: UpdateChatDto) {
    return this.chatsService.update(+id, updateChatDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.chatsService.remove(+id);
  }
}
