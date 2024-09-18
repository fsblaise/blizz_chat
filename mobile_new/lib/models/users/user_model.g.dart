// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      birthday: json['birthday'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      location: json['location'] as String?,
      gender: json['gender'] as String?,
      profileUrl: json['profileUrl'] as String?,
      isOnline: json['isOnline'] as bool,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'birthday': instance.birthday,
      'phoneNumber': instance.phoneNumber,
      'country': instance.country,
      'city': instance.city,
      'location': instance.location,
      'gender': instance.gender,
      'profileUrl': instance.profileUrl,
      'isOnline': instance.isOnline,
    };

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      birthday: json['birthday'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      location: json['location'] as String?,
      gender: json['gender'] as String?,
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      profileUrl: json['profileUrl'] as String?,
      unreadMessageSum: (json['unreadMessageSum'] as num).toInt(),
      unreadMessages: (json['unreadMessages'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      preferences: json['preferences'] == null
          ? null
          : Preference.fromJson(json['preferences'] as Map<String, dynamic>),
      securitySettings: json['securitySettings'] == null
          ? null
          : SecuritySettings.fromJson(
              json['securitySettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'birthday': instance.birthday,
      'phoneNumber': instance.phoneNumber,
      'country': instance.country,
      'city': instance.city,
      'location': instance.location,
      'gender': instance.gender,
      'contacts': instance.contacts,
      'profileUrl': instance.profileUrl,
      'unreadMessageSum': instance.unreadMessageSum,
      'unreadMessages': instance.unreadMessages,
      'preferences': instance.preferences,
      'securitySettings': instance.securitySettings,
    };

_$PreferenceImpl _$$PreferenceImplFromJson(Map<String, dynamic> json) =>
    _$PreferenceImpl(
      darkMode: json['darkMode'] as bool,
      syncDarkMode: json['syncDarkMode'] as bool,
      preferredColor: json['preferredColor'] as String,
    );

Map<String, dynamic> _$$PreferenceImplToJson(_$PreferenceImpl instance) =>
    <String, dynamic>{
      'darkMode': instance.darkMode,
      'syncDarkMode': instance.syncDarkMode,
      'preferredColor': instance.preferredColor,
    };

_$SecuritySettingsImpl _$$SecuritySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$SecuritySettingsImpl(
      showBirthDay: json['showBirthDay'] as bool,
      showHomePlace: json['showHomePlace'] as bool,
      showLocation: json['showLocation'] as bool,
      showGender: json['showGender'] as bool,
      showPhoneNumber: json['showPhoneNumber'] as bool,
    );

Map<String, dynamic> _$$SecuritySettingsImplToJson(
        _$SecuritySettingsImpl instance) =>
    <String, dynamic>{
      'showBirthDay': instance.showBirthDay,
      'showHomePlace': instance.showHomePlace,
      'showLocation': instance.showLocation,
      'showGender': instance.showGender,
      'showPhoneNumber': instance.showPhoneNumber,
    };

_$ContactImpl _$$ContactImplFromJson(Map<String, dynamic> json) =>
    _$ContactImpl(
      nickname: json['nickname'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'fullName': instance.fullName,
      'email': instance.email,
    };
