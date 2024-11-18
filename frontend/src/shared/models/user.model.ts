export interface User {
  fullName: string;
  email: string;
  birthday: string;
  phoneNumber: string;
  country: string;
  city: string;
  gender: string;
  profileUrl: string;
  preferences: Preferences;
  securitySettings: SecuritySettings;
}

export interface Preferences {
  darkMode: boolean;
  syncDarkMode: boolean;
  preferredColor: string;
}

export interface SecuritySettings {
  showBirthDay: boolean;
  showHomePlace: boolean;
  showGender: boolean;
  showPhoneNumber: boolean;
}