import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  late String fullName;
  final String email;
  late String birthday;
  late String phoneNumber;
  late String country;
  late String city;
  late String gender;
  late Contacts contacts;
  late String profileURL;
  late int unreadMessageSum;
  late Map<String, int> unreadMessages;
  late Preferences preferences;
  late SecuritySettings securitySettings;

  User(this.email, this.fullName) {
    profileURL = '';
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class Preferences {
  late bool darkMode;
  late bool syncDarkMode;
  late String preferredColor;
  late int chatFontSize;

  Preferences() {
    darkMode = false;
    syncDarkMode = false;
    preferredColor = '';
    chatFontSize = 24;
  }

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);
  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
}

@JsonSerializable()
class SecuritySettings {
  late bool showBirthDay;
  late bool showHomePlace;
  late bool showLocation;

  SecuritySettings() {
    showBirthDay = false;
    showHomePlace = false;
    showLocation = false;
  }

  Map<String, dynamic> toJson() => _$SecuritySettingsToJson(this);
  factory SecuritySettings.fromJson(Map<String, dynamic> json) =>
      _$SecuritySettingsFromJson(json);
}

@JsonSerializable()
class Contacts {
  late String nickname;
  late String fullName;
  late String email;

  Contacts();

  Map<String, dynamic> toJson() => _$ContactsToJson(this);
  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$ContactsFromJson(json);
}
