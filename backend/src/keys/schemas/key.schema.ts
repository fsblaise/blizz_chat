import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { Document, HydratedDocument } from "mongoose";

export type KeyDocument = HydratedDocument<Key>;

@Schema()
export class Key extends Document {
  @Prop({ unique: true, required: true, type: String })
  email: string;

  @Prop({ required: true, type: Number })
  regId: number;

  @Prop({ required: true, type: Buffer })
  identityPublicKey: Buffer;

  @Prop({ required: true, type: [Number] })
  preKeyIds: number[];

  @Prop({ required: true, type: [Buffer] })
  preKeys: Buffer[];

  @Prop({ required: true, type: Number })
  signedId: number;

  @Prop({ required: true, type: Buffer })
  signedPublicKey: Buffer;

  @Prop({ required: true, type: Buffer })
  signedKeySignature: Buffer;
}

export const KeySchema = SchemaFactory.createForClass(Key);