import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument, Types } from "mongoose";

export type ChatDocument = HydratedDocument<Chat>;
export type ParticipantDocument = HydratedDocument<Participant>;

@Schema({ _id: false })
export class Participant {
  @Prop({ type: Types.ObjectId, ref: 'User', required: true }) // Reference to User schema
  user: Types.ObjectId;

  @Prop({ required: true })
  nickname: string;
}

export const ParticipantSchema = SchemaFactory.createForClass(Participant);

@Schema()
export class Chat {
    @Prop({ required: true })
    title: string;
  
    @Prop()
    lastMessage: string;
  
    @Prop({ type: [ParticipantSchema], default: [] })
    participants: Participant[];
}

export const ChatSchema = SchemaFactory.createForClass(Chat);