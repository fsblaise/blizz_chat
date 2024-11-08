import { Injectable } from '@nestjs/common';
import { CreateStoryDto, StoryDto } from './dto/story.dto';
import { Story } from './schemas/story.schema';
import { Model } from 'mongoose';
import { InjectModel } from '@nestjs/mongoose';
import { join } from 'path';
import * as fs from 'fs';
import { Request } from 'express';

@Injectable()
export class StoriesService {

  constructor(@InjectModel(Story.name) private storyModel: Model<Story>) { }

  async create(createStoryDto: CreateStoryDto, file: Express.Multer.File, request: Request): Promise<StoryDto> {
    console.log("createStoryDto");
    console.log(file);

    const baseUrl = `${request.protocol}://${request.get('host')}`;
    
    const newStory = new this.storyModel({
      ...createStoryDto,
      imgUrl: `${baseUrl}/uploads/stories/${file.filename}`,
      extension: file.mimetype.split('/')[1],
      timestamp: new Date().toISOString(),
    });
    await newStory.save();
    return this.renderStory(newStory);
  }

  async findAll(): Promise<StoryDto[]> {
    const entities = await this.storyModel.find().exec();
    return entities.map(entity => this.renderStory(entity));
  }

  async findOne(id: string): Promise<StoryDto> {
    const entity = await this.storyModel.findById(id).exec();
    return this.renderStory(entity);
  }

  // async update(id: string, updateStoryDto: StoryDto): Promise<StoryDto> {
  //   const entity = await this.storyModel.findByIdAndUpdate(id, updateStoryDto, { new: true }).exec();
  //   return this.renderStory(entity);
  // }

  async remove(id: string): Promise<StoryDto> {
    const story = await this.storyModel.findByIdAndDelete(id).exec();
    if (story) {
      const filePath = join(__dirname, '..', 'uploads', story.imgUrl.split('/').pop());
      fs.unlinkSync(filePath);
    }
    return this.renderStory(story);
  }

  renderStory(story: Story): StoryDto {
    return {
      _id: story._id.toString(),
      caption: story.caption,
      extension: story.extension,
      imgUrl: story.imgUrl,    
      timestamp: story.timestamp,
      email: story.email,
      fullName: story.fullName,
    };
  }
}
