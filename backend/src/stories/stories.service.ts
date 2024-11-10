import { Injectable } from '@nestjs/common';
import { CreateStoryDto, StoryDto } from './dto/story.dto';
import { Story } from './schemas/story.schema';
import { Model } from 'mongoose';
import { InjectModel } from '@nestjs/mongoose';
import { join } from 'path';
import * as fs from 'fs';
import { Request } from 'express';
import { User } from 'src/users/schemas/user.schema';

@Injectable()
export class StoriesService {

  constructor(
    @InjectModel(Story.name) private storyModel: Model<Story>, 
    @InjectModel(User.name) private userModel: Model<User>,
  ) { }

  async create(createStoryDto: CreateStoryDto, file: Express.Multer.File, request: Request): Promise<StoryDto> {
    console.log("createStoryDto");
    console.log(file);
    console.log(createStoryDto);

    const baseUrl = `${request.protocol}://${request.get('host')}`;
    
    const newStory = new this.storyModel({
      caption: createStoryDto.caption,
      email: createStoryDto.email,
      fullName: createStoryDto.fullName,
      imgUrl: `${baseUrl}/uploads/stories/${file.filename}`,
      extension: file.mimetype.split('/')[1],
      timestamp: new Date().toISOString(),
    });
    console.log(newStory);
    
    await newStory.save();
    return this.renderStory(newStory);
  }

  async findAll(email: string): Promise<StoryDto[]> {
    const user = await this.userModel.findOne({ email }).exec();
    if (!user) {
      return [];
    }

    const contactEmails = user.contacts.map(contact => contact.email);
    contactEmails.push(email);

    const entities = await this.storyModel.find({ email: { $in: contactEmails } }).exec();
    const validEntities = [];

    for (const entity of entities) {
      const filePath = join(__dirname, '..', 'uploads/stories', entity.imgUrl.split('/').pop());
      if (fs.existsSync(filePath)) {
        validEntities.push(entity);
      } else {
        await this.storyModel.findByIdAndDelete(entity._id).exec();
      }
    }

    return validEntities.map(entity => this.renderStory(entity));
  }

  async findOne(id: string): Promise<StoryDto> {
    const entity = await this.storyModel.findById(id).exec();
    return this.renderStory(entity);
  }

  async remove(id: string, email: string): Promise<void> {
    const story = await this.storyModel.findByIdAndDelete(id).exec();
    if (story) {
      const filePath = join(__dirname, '..', 'uploads/stories', story.imgUrl.split('/').pop());
      fs.unlinkSync(filePath);
    }
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
