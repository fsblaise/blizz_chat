import { Controller, Get, Post, Body, Patch, Param, Delete, UseInterceptors, UploadedFile, Req } from '@nestjs/common';
import { StoriesService } from './stories.service';
import { CreateStoryDto, StoryDto } from './dto/story.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { join } from 'path';
import * as fs from 'fs';
import { Request } from 'express';

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
  @UseInterceptors(FileInterceptor('file', { storage }))
  create(
    @Body() createStoryDto: CreateStoryDto,
    @UploadedFile() file: Express.Multer.File,
    @Req() request: Request,
  ) {
    return this.storiesService.create(createStoryDto, file, request);
  }

  @Get()
  findAll(): Promise<StoryDto[]> {
    return this.storiesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<StoryDto>  {
    return this.storiesService.findOne(id);
  }

  // @Patch(':id')
  // update(@Param('id') id: string, @Body() updateStoryDto: UpdateStoryDto) {
  //   return this.storiesService.update(id, updateStoryDto);
  // }

  @Delete(':id')
  remove(@Param('id') id: string): Promise<StoryDto>  {
    return this.storiesService.remove(id);
  }
}
