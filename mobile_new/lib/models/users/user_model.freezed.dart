// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get profileUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String fullName,
      String email,
      String? birthday,
      String? phoneNumber,
      String? country,
      String? city,
      String? location,
      String? gender,
      String? profileUrl});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = null,
    Object? birthday = freezed,
    Object? phoneNumber = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? location = freezed,
    Object? gender = freezed,
    Object? profileUrl = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullName,
      String email,
      String? birthday,
      String? phoneNumber,
      String? country,
      String? city,
      String? location,
      String? gender,
      String? profileUrl});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = null,
    Object? birthday = freezed,
    Object? phoneNumber = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? location = freezed,
    Object? gender = freezed,
    Object? profileUrl = freezed,
  }) {
    return _then(_$UserImpl(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.fullName,
      required this.email,
      required this.birthday,
      required this.phoneNumber,
      required this.country,
      required this.city,
      required this.location,
      required this.gender,
      required this.profileUrl});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String fullName;
  @override
  final String email;
  @override
  final String? birthday;
  @override
  final String? phoneNumber;
  @override
  final String? country;
  @override
  final String? city;
  @override
  final String? location;
  @override
  final String? gender;
  @override
  final String? profileUrl;

  @override
  String toString() {
    return 'User(fullName: $fullName, email: $email, birthday: $birthday, phoneNumber: $phoneNumber, country: $country, city: $city, location: $location, gender: $gender, profileUrl: $profileUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profileUrl, profileUrl) ||
                other.profileUrl == profileUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, email, birthday,
      phoneNumber, country, city, location, gender, profileUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String fullName,
      required final String email,
      required final String? birthday,
      required final String? phoneNumber,
      required final String? country,
      required final String? city,
      required final String? location,
      required final String? gender,
      required final String? profileUrl}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get fullName;
  @override
  String get email;
  @override
  String? get birthday;
  @override
  String? get phoneNumber;
  @override
  String? get country;
  @override
  String? get city;
  @override
  String? get location;
  @override
  String? get gender;
  @override
  String? get profileUrl;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  List<Contact?>? get contacts => throw _privateConstructorUsedError;
  String? get profileUrl => throw _privateConstructorUsedError;
  int get unreadMessageSum => throw _privateConstructorUsedError;
  Map<String, String?>? get unreadMessages =>
      throw _privateConstructorUsedError;
  Preference? get preferences => throw _privateConstructorUsedError;
  SecuritySettings? get securitySettings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String fullName,
      String email,
      String? birthday,
      String? phoneNumber,
      String? country,
      String? city,
      String? location,
      String? gender,
      List<Contact?>? contacts,
      String? profileUrl,
      int unreadMessageSum,
      Map<String, String?>? unreadMessages,
      Preference? preferences,
      SecuritySettings? securitySettings});

  $PreferenceCopyWith<$Res>? get preferences;
  $SecuritySettingsCopyWith<$Res>? get securitySettings;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = null,
    Object? birthday = freezed,
    Object? phoneNumber = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? location = freezed,
    Object? gender = freezed,
    Object? contacts = freezed,
    Object? profileUrl = freezed,
    Object? unreadMessageSum = null,
    Object? unreadMessages = freezed,
    Object? preferences = freezed,
    Object? securitySettings = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact?>?,
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadMessageSum: null == unreadMessageSum
          ? _value.unreadMessageSum
          : unreadMessageSum // ignore: cast_nullable_to_non_nullable
              as int,
      unreadMessages: freezed == unreadMessages
          ? _value.unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>?,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Preference?,
      securitySettings: freezed == securitySettings
          ? _value.securitySettings
          : securitySettings // ignore: cast_nullable_to_non_nullable
              as SecuritySettings?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PreferenceCopyWith<$Res>? get preferences {
    if (_value.preferences == null) {
      return null;
    }

    return $PreferenceCopyWith<$Res>(_value.preferences!, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SecuritySettingsCopyWith<$Res>? get securitySettings {
    if (_value.securitySettings == null) {
      return null;
    }

    return $SecuritySettingsCopyWith<$Res>(_value.securitySettings!, (value) {
      return _then(_value.copyWith(securitySettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullName,
      String email,
      String? birthday,
      String? phoneNumber,
      String? country,
      String? city,
      String? location,
      String? gender,
      List<Contact?>? contacts,
      String? profileUrl,
      int unreadMessageSum,
      Map<String, String?>? unreadMessages,
      Preference? preferences,
      SecuritySettings? securitySettings});

  @override
  $PreferenceCopyWith<$Res>? get preferences;
  @override
  $SecuritySettingsCopyWith<$Res>? get securitySettings;
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = null,
    Object? birthday = freezed,
    Object? phoneNumber = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? location = freezed,
    Object? gender = freezed,
    Object? contacts = freezed,
    Object? profileUrl = freezed,
    Object? unreadMessageSum = null,
    Object? unreadMessages = freezed,
    Object? preferences = freezed,
    Object? securitySettings = freezed,
  }) {
    return _then(_$UserProfileImpl(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      contacts: freezed == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact?>?,
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadMessageSum: null == unreadMessageSum
          ? _value.unreadMessageSum
          : unreadMessageSum // ignore: cast_nullable_to_non_nullable
              as int,
      unreadMessages: freezed == unreadMessages
          ? _value._unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>?,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Preference?,
      securitySettings: freezed == securitySettings
          ? _value.securitySettings
          : securitySettings // ignore: cast_nullable_to_non_nullable
              as SecuritySettings?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {required this.fullName,
      required this.email,
      required this.birthday,
      required this.phoneNumber,
      required this.country,
      required this.city,
      required this.location,
      required this.gender,
      required final List<Contact?>? contacts,
      required this.profileUrl,
      required this.unreadMessageSum,
      required final Map<String, String?>? unreadMessages,
      required this.preferences,
      required this.securitySettings})
      : _contacts = contacts,
        _unreadMessages = unreadMessages;

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String fullName;
  @override
  final String email;
  @override
  final String? birthday;
  @override
  final String? phoneNumber;
  @override
  final String? country;
  @override
  final String? city;
  @override
  final String? location;
  @override
  final String? gender;
  final List<Contact?>? _contacts;
  @override
  List<Contact?>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? profileUrl;
  @override
  final int unreadMessageSum;
  final Map<String, String?>? _unreadMessages;
  @override
  Map<String, String?>? get unreadMessages {
    final value = _unreadMessages;
    if (value == null) return null;
    if (_unreadMessages is EqualUnmodifiableMapView) return _unreadMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final Preference? preferences;
  @override
  final SecuritySettings? securitySettings;

  @override
  String toString() {
    return 'UserProfile(fullName: $fullName, email: $email, birthday: $birthday, phoneNumber: $phoneNumber, country: $country, city: $city, location: $location, gender: $gender, contacts: $contacts, profileUrl: $profileUrl, unreadMessageSum: $unreadMessageSum, unreadMessages: $unreadMessages, preferences: $preferences, securitySettings: $securitySettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            (identical(other.profileUrl, profileUrl) ||
                other.profileUrl == profileUrl) &&
            (identical(other.unreadMessageSum, unreadMessageSum) ||
                other.unreadMessageSum == unreadMessageSum) &&
            const DeepCollectionEquality()
                .equals(other._unreadMessages, _unreadMessages) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.securitySettings, securitySettings) ||
                other.securitySettings == securitySettings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullName,
      email,
      birthday,
      phoneNumber,
      country,
      city,
      location,
      gender,
      const DeepCollectionEquality().hash(_contacts),
      profileUrl,
      unreadMessageSum,
      const DeepCollectionEquality().hash(_unreadMessages),
      preferences,
      securitySettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {required final String fullName,
      required final String email,
      required final String? birthday,
      required final String? phoneNumber,
      required final String? country,
      required final String? city,
      required final String? location,
      required final String? gender,
      required final List<Contact?>? contacts,
      required final String? profileUrl,
      required final int unreadMessageSum,
      required final Map<String, String?>? unreadMessages,
      required final Preference? preferences,
      required final SecuritySettings? securitySettings}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get fullName;
  @override
  String get email;
  @override
  String? get birthday;
  @override
  String? get phoneNumber;
  @override
  String? get country;
  @override
  String? get city;
  @override
  String? get location;
  @override
  String? get gender;
  @override
  List<Contact?>? get contacts;
  @override
  String? get profileUrl;
  @override
  int get unreadMessageSum;
  @override
  Map<String, String?>? get unreadMessages;
  @override
  Preference? get preferences;
  @override
  SecuritySettings? get securitySettings;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Preference _$PreferenceFromJson(Map<String, dynamic> json) {
  return _Preference.fromJson(json);
}

/// @nodoc
mixin _$Preference {
  bool get darkMode => throw _privateConstructorUsedError;
  bool get syncDarkMode => throw _privateConstructorUsedError;
  String get preferredColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreferenceCopyWith<Preference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceCopyWith<$Res> {
  factory $PreferenceCopyWith(
          Preference value, $Res Function(Preference) then) =
      _$PreferenceCopyWithImpl<$Res, Preference>;
  @useResult
  $Res call({bool darkMode, bool syncDarkMode, String preferredColor});
}

/// @nodoc
class _$PreferenceCopyWithImpl<$Res, $Val extends Preference>
    implements $PreferenceCopyWith<$Res> {
  _$PreferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkMode = null,
    Object? syncDarkMode = null,
    Object? preferredColor = null,
  }) {
    return _then(_value.copyWith(
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      syncDarkMode: null == syncDarkMode
          ? _value.syncDarkMode
          : syncDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      preferredColor: null == preferredColor
          ? _value.preferredColor
          : preferredColor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferenceImplCopyWith<$Res>
    implements $PreferenceCopyWith<$Res> {
  factory _$$PreferenceImplCopyWith(
          _$PreferenceImpl value, $Res Function(_$PreferenceImpl) then) =
      __$$PreferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool darkMode, bool syncDarkMode, String preferredColor});
}

/// @nodoc
class __$$PreferenceImplCopyWithImpl<$Res>
    extends _$PreferenceCopyWithImpl<$Res, _$PreferenceImpl>
    implements _$$PreferenceImplCopyWith<$Res> {
  __$$PreferenceImplCopyWithImpl(
      _$PreferenceImpl _value, $Res Function(_$PreferenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkMode = null,
    Object? syncDarkMode = null,
    Object? preferredColor = null,
  }) {
    return _then(_$PreferenceImpl(
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      syncDarkMode: null == syncDarkMode
          ? _value.syncDarkMode
          : syncDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      preferredColor: null == preferredColor
          ? _value.preferredColor
          : preferredColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferenceImpl implements _Preference {
  const _$PreferenceImpl(
      {required this.darkMode,
      required this.syncDarkMode,
      required this.preferredColor});

  factory _$PreferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceImplFromJson(json);

  @override
  final bool darkMode;
  @override
  final bool syncDarkMode;
  @override
  final String preferredColor;

  @override
  String toString() {
    return 'Preference(darkMode: $darkMode, syncDarkMode: $syncDarkMode, preferredColor: $preferredColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceImpl &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            (identical(other.syncDarkMode, syncDarkMode) ||
                other.syncDarkMode == syncDarkMode) &&
            (identical(other.preferredColor, preferredColor) ||
                other.preferredColor == preferredColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, darkMode, syncDarkMode, preferredColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceImplCopyWith<_$PreferenceImpl> get copyWith =>
      __$$PreferenceImplCopyWithImpl<_$PreferenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferenceImplToJson(
      this,
    );
  }
}

abstract class _Preference implements Preference {
  const factory _Preference(
      {required final bool darkMode,
      required final bool syncDarkMode,
      required final String preferredColor}) = _$PreferenceImpl;

  factory _Preference.fromJson(Map<String, dynamic> json) =
      _$PreferenceImpl.fromJson;

  @override
  bool get darkMode;
  @override
  bool get syncDarkMode;
  @override
  String get preferredColor;
  @override
  @JsonKey(ignore: true)
  _$$PreferenceImplCopyWith<_$PreferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SecuritySettings _$SecuritySettingsFromJson(Map<String, dynamic> json) {
  return _SecuritySettings.fromJson(json);
}

/// @nodoc
mixin _$SecuritySettings {
  bool get showBirthDay => throw _privateConstructorUsedError;
  bool get showHomePlace => throw _privateConstructorUsedError;
  bool get showLocation => throw _privateConstructorUsedError;
  bool get showGender => throw _privateConstructorUsedError;
  bool get showPhoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecuritySettingsCopyWith<SecuritySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecuritySettingsCopyWith<$Res> {
  factory $SecuritySettingsCopyWith(
          SecuritySettings value, $Res Function(SecuritySettings) then) =
      _$SecuritySettingsCopyWithImpl<$Res, SecuritySettings>;
  @useResult
  $Res call(
      {bool showBirthDay,
      bool showHomePlace,
      bool showLocation,
      bool showGender,
      bool showPhoneNumber});
}

/// @nodoc
class _$SecuritySettingsCopyWithImpl<$Res, $Val extends SecuritySettings>
    implements $SecuritySettingsCopyWith<$Res> {
  _$SecuritySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showBirthDay = null,
    Object? showHomePlace = null,
    Object? showLocation = null,
    Object? showGender = null,
    Object? showPhoneNumber = null,
  }) {
    return _then(_value.copyWith(
      showBirthDay: null == showBirthDay
          ? _value.showBirthDay
          : showBirthDay // ignore: cast_nullable_to_non_nullable
              as bool,
      showHomePlace: null == showHomePlace
          ? _value.showHomePlace
          : showHomePlace // ignore: cast_nullable_to_non_nullable
              as bool,
      showLocation: null == showLocation
          ? _value.showLocation
          : showLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      showGender: null == showGender
          ? _value.showGender
          : showGender // ignore: cast_nullable_to_non_nullable
              as bool,
      showPhoneNumber: null == showPhoneNumber
          ? _value.showPhoneNumber
          : showPhoneNumber // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecuritySettingsImplCopyWith<$Res>
    implements $SecuritySettingsCopyWith<$Res> {
  factory _$$SecuritySettingsImplCopyWith(_$SecuritySettingsImpl value,
          $Res Function(_$SecuritySettingsImpl) then) =
      __$$SecuritySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool showBirthDay,
      bool showHomePlace,
      bool showLocation,
      bool showGender,
      bool showPhoneNumber});
}

/// @nodoc
class __$$SecuritySettingsImplCopyWithImpl<$Res>
    extends _$SecuritySettingsCopyWithImpl<$Res, _$SecuritySettingsImpl>
    implements _$$SecuritySettingsImplCopyWith<$Res> {
  __$$SecuritySettingsImplCopyWithImpl(_$SecuritySettingsImpl _value,
      $Res Function(_$SecuritySettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showBirthDay = null,
    Object? showHomePlace = null,
    Object? showLocation = null,
    Object? showGender = null,
    Object? showPhoneNumber = null,
  }) {
    return _then(_$SecuritySettingsImpl(
      showBirthDay: null == showBirthDay
          ? _value.showBirthDay
          : showBirthDay // ignore: cast_nullable_to_non_nullable
              as bool,
      showHomePlace: null == showHomePlace
          ? _value.showHomePlace
          : showHomePlace // ignore: cast_nullable_to_non_nullable
              as bool,
      showLocation: null == showLocation
          ? _value.showLocation
          : showLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      showGender: null == showGender
          ? _value.showGender
          : showGender // ignore: cast_nullable_to_non_nullable
              as bool,
      showPhoneNumber: null == showPhoneNumber
          ? _value.showPhoneNumber
          : showPhoneNumber // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SecuritySettingsImpl implements _SecuritySettings {
  const _$SecuritySettingsImpl(
      {required this.showBirthDay,
      required this.showHomePlace,
      required this.showLocation,
      required this.showGender,
      required this.showPhoneNumber});

  factory _$SecuritySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecuritySettingsImplFromJson(json);

  @override
  final bool showBirthDay;
  @override
  final bool showHomePlace;
  @override
  final bool showLocation;
  @override
  final bool showGender;
  @override
  final bool showPhoneNumber;

  @override
  String toString() {
    return 'SecuritySettings(showBirthDay: $showBirthDay, showHomePlace: $showHomePlace, showLocation: $showLocation, showGender: $showGender, showPhoneNumber: $showPhoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecuritySettingsImpl &&
            (identical(other.showBirthDay, showBirthDay) ||
                other.showBirthDay == showBirthDay) &&
            (identical(other.showHomePlace, showHomePlace) ||
                other.showHomePlace == showHomePlace) &&
            (identical(other.showLocation, showLocation) ||
                other.showLocation == showLocation) &&
            (identical(other.showGender, showGender) ||
                other.showGender == showGender) &&
            (identical(other.showPhoneNumber, showPhoneNumber) ||
                other.showPhoneNumber == showPhoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, showBirthDay, showHomePlace,
      showLocation, showGender, showPhoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SecuritySettingsImplCopyWith<_$SecuritySettingsImpl> get copyWith =>
      __$$SecuritySettingsImplCopyWithImpl<_$SecuritySettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SecuritySettingsImplToJson(
      this,
    );
  }
}

abstract class _SecuritySettings implements SecuritySettings {
  const factory _SecuritySettings(
      {required final bool showBirthDay,
      required final bool showHomePlace,
      required final bool showLocation,
      required final bool showGender,
      required final bool showPhoneNumber}) = _$SecuritySettingsImpl;

  factory _SecuritySettings.fromJson(Map<String, dynamic> json) =
      _$SecuritySettingsImpl.fromJson;

  @override
  bool get showBirthDay;
  @override
  bool get showHomePlace;
  @override
  bool get showLocation;
  @override
  bool get showGender;
  @override
  bool get showPhoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$SecuritySettingsImplCopyWith<_$SecuritySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  String get nickname => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call({String nickname, String fullName, String email});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? fullName = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactImplCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$ContactImplCopyWith(
          _$ContactImpl value, $Res Function(_$ContactImpl) then) =
      __$$ContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nickname, String fullName, String email});
}

/// @nodoc
class __$$ContactImplCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$ContactImpl>
    implements _$$ContactImplCopyWith<$Res> {
  __$$ContactImplCopyWithImpl(
      _$ContactImpl _value, $Res Function(_$ContactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? fullName = null,
    Object? email = null,
  }) {
    return _then(_$ContactImpl(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactImpl implements _Contact {
  const _$ContactImpl(
      {required this.nickname, required this.fullName, required this.email});

  factory _$ContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactImplFromJson(json);

  @override
  final String nickname;
  @override
  final String fullName;
  @override
  final String email;

  @override
  String toString() {
    return 'Contact(nickname: $nickname, fullName: $fullName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nickname, fullName, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      __$$ContactImplCopyWithImpl<_$ContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactImplToJson(
      this,
    );
  }
}

abstract class _Contact implements Contact {
  const factory _Contact(
      {required final String nickname,
      required final String fullName,
      required final String email}) = _$ContactImpl;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$ContactImpl.fromJson;

  @override
  String get nickname;
  @override
  String get fullName;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
