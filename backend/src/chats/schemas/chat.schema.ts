import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument, Types } from "mongoose";

export type ChatDocument = HydratedDocument<Chat>;
export type ParticipantDocument = HydratedDocument<Participant>;

@Schema()
export class Participant {
  @Prop()
  nickname: string;

  @Prop()
  fullName: string;

  @Prop()
  email: string;
}

@Schema()
export class Chat {
    @Prop({ required: true })
    title: string;
  
    @Prop({ required: false, default: null})
    lastMessage: string;
  
    @Prop({ required: true, type: [Participant] })
    participants: Participant[];
}

export const ChatSchema = SchemaFactory.createForClass(Chat);