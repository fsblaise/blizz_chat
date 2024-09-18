import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String fullName,
    required String email,
    required String? birthday,
    required String? phoneNumber,
    required String? country,
    required String? city,
    required String? location,
    required String? gender,
    required String? profileUrl,
    required bool isOnline,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String fullName,
    required String email,
    required String? birthday,
    required String? phoneNumber,
    required String? country,
    required String? city,
    required String? location,
    required String? gender,
    required List<Contact> contacts,
    required String? profileUrl,
    required int unreadMessageSum,
    required Map<String, String?>? unreadMessages,
    required Preference? preferences,
    required SecuritySettings? securitySettings,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class Preference with _$Preference {
  const factory Preference({
    required bool darkMode,
    required bool syncDarkMode,
    required String preferredColor,
  }) = _Preference;

  factory Preference.fromJson(Map<String, dynamic> json) =>
      _$PreferenceFromJson(json);
}

@freezed
class SecuritySettings with _$SecuritySettings {
  const factory SecuritySettings({
    required bool showBirthDay,
    required bool showHomePlace,
    required bool showLocation,
    required bool showGender,
    required bool showPhoneNumber,
  }) = _SecuritySettings;

  factory SecuritySettings.fromJson(Map<String, dynamic> json) =>
      _$SecuritySettingsFromJson(json);
}

@freezed
class Contact with _$Contact {
  const factory Contact({
    required String nickname,
    required String fullName,
    required String email,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}
