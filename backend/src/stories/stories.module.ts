import { Module } from '@nestjs/common';
import { StoriesService } from './stories.service';
import { StoriesController } from './stories.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { Story, StorySchema } from './schemas/story.schema';

@Module({
  imports: [MongooseModule.forFeature([{ name: Story.name, schema: StorySchema}])],
  controllers: [StoriesController],
  providers: [StoriesService],
})
export class StoriesModule {}
