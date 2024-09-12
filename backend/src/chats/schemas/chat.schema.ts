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

    @Prop({ required: true, default: false })
    isGroupChat: boolean;
  
    @Prop({ required: false, default: null})
    lastMessage: string;
  
    @Prop({ required: true, type: [Participant] })
    participants: Participant[];

    @Prop({ required: true, type: [Participant] })
    originalParticipants: Participant[];
}

export const ChatSchema = SchemaFactory.createForClass(Chat);