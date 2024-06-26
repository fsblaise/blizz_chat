export interface User {
  fullName: string;
  email: string;
  birthday: string;
  phoneNumber: string;
  country: string;
  city: string;
  gender: string;
  contacts: Contact[];
  profileUrl: string;
  unreadMessageSum: number;
  unreadMessages: Map<string, number>;
  preferences: Preferences;
  securitySettings: SecuritySettings;
}

export interface Preferences {
  darkMode: boolean;
  syncDarkMode: boolean;
  preferredColor: string;
  chatFontSize: number;
}

export interface SecuritySettings {
  showBirthDay: boolean;
  showHomePlace: boolean;
  showLocation: boolean;
}

export interface Contact {
  nickname: string;
  fullName: string;
  email: string;
}

export type UserState = User[];