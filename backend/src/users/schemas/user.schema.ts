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

  @Prop({ unique: true })
  email: string;

  @Prop({ type: Types.ObjectId, ref: 'User' }) // Reference to User document by _id
  user: Types.ObjectId;
}

@Schema()
export class User {
  @Prop({ required: true })
  fullName: string;

  @Prop({ required: true, unique: true })
  email: string;

  @Prop({ required: true })
  password: string;

  @Prop({ required: false })
  birthday: string;

  @Prop({ required: false })
  phoneNumber: string;

  @Prop({ required: false })
  country: string;

  @Prop({ required: false })
  city: string;

  @Prop({ required: false })
  location: string;

  @Prop({ required: false })
  gender: string;

  @Prop({ type: [Contact], default: [] })
  contacts: Contact[];

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