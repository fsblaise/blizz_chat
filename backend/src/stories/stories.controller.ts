import { Controller, Get, Post, Body, Patch, Param, Delete, UseInterceptors, UploadedFile, Req, UseGuards } from '@nestjs/common';
import { StoriesService } from './stories.service';
import { CreateStoryDto, CreateStoryDtoWrapper, StoryDto } from './dto/story.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { join } from 'path';
import * as fs from 'fs';
import { Request } from 'express';
import { AuthGuard } from 'src/shared/guards/auth.guard';

const storage = diskStorage({
  destination: (req, file, cb) => {
    const dir = join(__dirname, '..', 'uploads/stories');

    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir, { recursive: true });
    }

    cb(null, dir);
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1e9);
    cb(null, `${file.fieldname}-${uniqueSuffix}-${file.originalname}`);
  },
});

@Controller('stories')
export class StoriesController {
  constructor(private readonly storiesService: StoriesService) { }

  @Post()
  @UseGuards(AuthGuard)
  @UseInterceptors(FileInterceptor('file', { storage }))
  create(
    @Body('createStoryDto') createStoryDtoJson: string,
    @UploadedFile() file: Express.Multer.File,
    @Req() request: Request,
  ) {
    const createStoryDto: CreateStoryDto = JSON.parse(createStoryDtoJson);
    return this.storiesService.create(createStoryDto, file, request);
  }

  @Get()
  @UseGuards(AuthGuard)
  findAll(@Req() request: Request): Promise<StoryDto[]> {
    const user = request['user'];
    return this.storiesService.findAll(user.email);
  }

  @Get(':id')
  @UseGuards(AuthGuard)
  findOne(@Param('id') id: string): Promise<StoryDto>  {
    return this.storiesService.findOne(id);
  }

  @Delete(':id')
  @UseGuards(AuthGuard)
  remove(@Param('id') id: string, @Req() request: Request): void {
    const user = request['user'];
    this.storiesService.remove(id, user.email);
  }
}
