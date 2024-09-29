import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument, Types } from "mongoose";

export type DistributionKeyDocument = HydratedDocument<DistributionKey>;

@Schema()
export class DistributionKey {
  @Prop({ required: true })
  key: Buffer;

  @Prop({ required: true })
  senderEmail: string;

  @Prop({ required: true })
  groupId: string;

  @Prop({ required: true })
  messageType: number;

  @Prop({ required: true })
  to: string;
}

export const DistributionKeySchema = SchemaFactory.createForClass(DistributionKey);