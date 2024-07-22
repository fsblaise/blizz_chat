// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['email'] as String,
      json['fullName'] as String,
    )
      ..birthday = json['birthday'] as String
      ..phoneNumber = json['phoneNumber'] as String
      ..country = json['country'] as String
      ..city = json['city'] as String
      ..gender = json['gender'] as String
      ..contacts = Contacts.fromJson(json['contacts'] as Map<String, dynamic>)
      ..profileURL = json['profileURL'] as String
      ..unreadMessageSum = json['unreadMessageSum'] as int
      ..unreadMessages = Map<String, int>.from(json['unreadMessages'] as Map)
      ..preferences =
          Preferences.fromJson(json['preferences'] as Map<String, dynamic>)
      ..securitySettings = SecuritySettings.fromJson(
          json['securitySettings'] as Map<String, dynamic>);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'birthday': instance.birthday,
      'phoneNumber': instance.phoneNumber,
      'country': instance.country,
      'city': instance.city,
      'gender': instance.gender,
      'contacts': instance.contacts,
      'profileURL': instance.profileURL,
      'unreadMessageSum': instance.unreadMessageSum,
      'unreadMessages': instance.unreadMessages,
      'preferences': instance.preferences,
      'securitySettings': instance.securitySettings,
    };

Preferences _$PreferencesFromJson(Map<String, dynamic> json) => Preferences()
  ..darkMode = json['darkMode'] as bool
  ..syncDarkMode = json['syncDarkMode'] as bool
  ..preferredColor = json['preferredColor'] as String
  ..chatFontSize = json['chatFontSize'] as int;

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'darkMode': instance.darkMode,
      'syncDarkMode': instance.syncDarkMode,
      'preferredColor': instance.preferredColor,
      'chatFontSize': instance.chatFontSize,
    };

SecuritySettings _$SecuritySettingsFromJson(Map<String, dynamic> json) =>
    SecuritySettings()
      ..showBirthDay = json['showBirthDay'] as bool
      ..showHomePlace = json['showHomePlace'] as bool
      ..showLocation = json['showLocation'] as bool;

Map<String, dynamic> _$SecuritySettingsToJson(SecuritySettings instance) =>
    <String, dynamic>{
      'showBirthDay': instance.showBirthDay,
      'showHomePlace': instance.showHomePlace,
      'showLocation': instance.showLocation,
    };

Contacts _$ContactsFromJson(Map<String, dynamic> json) => Contacts()
  ..nickname = json['nickname'] as String
  ..fullName = json['fullName'] as String
  ..email = json['email'] as String;

Map<String, dynamic> _$ContactsToJson(Contacts instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'fullName': instance.fullName,
      'email': instance.email,
    };
