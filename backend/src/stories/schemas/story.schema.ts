import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument, Types } from "mongoose";

export type StoryDocument = HydratedDocument<Story>;

@Schema()
export class Story {
  @Prop()
  caption: string;

  @Prop({ required: true })
  extension: string;

  @Prop({ required: true })
  imgUrl: string;

  @Prop({ required: true })
  timestamp: string;

  @Prop({ type: Types.ObjectId, ref: 'User', required: true })
  senderId: Types.ObjectId;
}

export const StorySchema = SchemaFactory.createForClass(Story);
