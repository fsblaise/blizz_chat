import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument, Document } from "mongoose";


export type CompanyDocument = HydratedDocument<Company>;
export type MemberDocument = HydratedDocument<Member>;

@Schema()
export class Member {
  @Prop()
  fullName: string;

  @Prop()
  email: string;

  @Prop()
  role: string;
}

@Schema()
export class Company extends Document {
  @Prop()
  name: string;

  @Prop()
  apiUrl: string;

  @Prop()
  members: Member[];
}

export const CompanySchema = SchemaFactory.createForClass(Company);
