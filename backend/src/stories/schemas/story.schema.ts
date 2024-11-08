import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { Document, HydratedDocument, Types } from "mongoose";

export type StoryDocument = HydratedDocument<Story>;

@Schema()
export class Story extends Document{
  @Prop()
  caption: string;

  @Prop({ required: true })
  extension: string;

  @Prop({ required: true, unique: true })
  imgUrl: string;

  @Prop({ required: true })
  timestamp: string;

  @Prop({ required: true })
  email: string;

  @Prop({ required: true })
  fullName: string;
}

export const StorySchema = SchemaFactory.createForClass(Story);
