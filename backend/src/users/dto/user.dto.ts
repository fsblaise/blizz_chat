export class UserProfileDto {
  fullName: string;
  email: string;
  birthday: string;
  phoneNumber: string;
  country: string;
  city: string;
  gender: string;
  contacts: ContactDto[];
  profileUrl: string;
  unreadMessageSum: number;
  unreadMessages: Map<string, number>;
  preferences: PreferencesDto;
  securitySettings: SecuritySettingsDto;
}

export class UserDto {
  fullName: string;
  email: string;
  birthday: string;
  phoneNumber: string;
  country: string;
  city: string;
  location: string;
  gender: string;
  profileUrl: string;
}

export class PreferencesDto {
  darkMode: boolean;
  syncDarkMode: boolean;
  preferredColor: string;
  chatFontSize: number;
}

export class SecuritySettingsDto {
  showBirthDay: boolean;
  showHomePlace: boolean;
  showLocation: boolean;
  showGender: boolean;
  showPhoneNumber: boolean;
}

export class ContactDto {
  nickname: string;
  fullName: string;
  email: string;
  user: any;
}