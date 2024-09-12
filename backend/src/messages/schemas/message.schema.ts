import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument, Types } from "mongoose";

export type MessageQueueDocument = HydratedDocument<MessageQueue>;

@Schema()
export class MessageQueue {
  @Prop({ type: Types.ObjectId, auto: true })
  _id: Types.ObjectId;

  @Prop({ required: true })
  from: string;

  @Prop({ required: true })
  to: string;

  @Prop({ required: true })
  message: string;

  @Prop({ required: true })
  timestamp: string;

  @Prop({ required: true })
  chatId: string;
}

export const MessageQueueSchema = SchemaFactory.createForClass(MessageQueue);
