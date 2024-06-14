import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument, Types } from "mongoose";

export type UserDocument = HydratedDocument<User>;

@Schema()
export class Preferences {
  @Prop({ default: false })
  darkMode: boolean;

  @Prop({ default: false })
  syncDarkMode: boolean;

  @Prop()
  preferredColor: string;

  @Prop()
  chatFontSize: number;
}

@Schema()
export class SecuritySettings {
  @Prop({ default: false })
  showBirthDay: boolean;

  @Prop({ default: false })
  showHomePlace: boolean;

  @Prop({ default: false })
  showLocation: boolean;
}

@Schema()
export class User {
  @Prop({ required: true })
  fullName: string;

  @Prop({ required: true, unique: true })
  email: string;

  @Prop({ required: true })
  birthday: string;

  @Prop({ required: true })
  phoneNumber: string;

  @Prop({ required: true })
  country: string;

  @Prop({ required: true })
  city: string;

  @Prop({ required: true })
  gender: string;

  @Prop({ type: [Types.ObjectId], ref: 'User' })
  contacts: Types.ObjectId[];

  @Prop()
  profileUrl: string;

  @Prop({ default: 0 })
  unreadMessageSum: number;

  @Prop({ type: Map, of: Number, default: {} })
  unreadMessages: Map<string, number>;

  @Prop({ type: Preferences, default: {} })
  preferences: Preferences;

  @Prop({ type: SecuritySettings, default: {} })
  securitySettings: SecuritySettings;
}

export const UserSchema = SchemaFactory.createForClass(User);