import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument, Types } from "mongoose";

export type UserDocument = HydratedDocument<User>;

@Schema()
export class Preferences {
  @Prop({ default: false })
  darkMode: boolean;

  @Prop({ default: false })
  syncDarkMode: boolean;

  @Prop({ default: 'purple' })
  preferredColor: string;
}

@Schema()
export class SecuritySettings {
  @Prop({ default: false })
  showBirthDay: boolean;

  @Prop({ default: false })
  showHomePlace: boolean;

  @Prop({ default: false })
  showLocation: boolean;

  @Prop({ default: false })
  showGender: boolean;

  @Prop({ default: false })
  showPhoneNumber: boolean;
}


@Schema()
export class Contact {
  @Prop()
  nickname: string;

  @Prop()
  fullName: string;

  @Prop()
  email: string;
}

@Schema()
export class User {
  @Prop({ required: true })
  fullName: string;

  @Prop({ required: true, unique: true })
  email: string;

  @Prop({ required: true })
  password: string;

  @Prop({ required: false, default: null })
  birthday: string;

  @Prop({ required: false, default: null })
  phoneNumber: string;

  @Prop({ required: false, default: null })
  country: string;

  @Prop({ required: false, default: null })
  city: string;

  @Prop({ required: false, default: null })
  location: string;

  @Prop({ required: false, default: null })
  gender: string;

  @Prop({ required: false, type: [Contact], default: [] })
  contacts: Contact[];

  @Prop({ required: false, default: null })
  profileUrl: string;

  @Prop({ required: false, default: 0 })
  unreadMessageSum: number;

  @Prop({ required: false, type: Map, of: String, default: {} })
  unreadMessages: Map<string, string>;

  @Prop({ required: false, type: Preferences, default: {} })
  preferences: Preferences;

  @Prop({ required: false, type: SecuritySettings, default: {} })
  securitySettings: SecuritySettings;
}

export const UserSchema = SchemaFactory.createForClass(User);