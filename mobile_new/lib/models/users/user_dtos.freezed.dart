// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddContactDto _$AddContactDtoFromJson(Map<String, dynamic> json) {
  return _AddContactDto.fromJson(json);
}

/// @nodoc
mixin _$AddContactDto {
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddContactDtoCopyWith<AddContactDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddContactDtoCopyWith<$Res> {
  factory $AddContactDtoCopyWith(
          AddContactDto value, $Res Function(AddContactDto) then) =
      _$AddContactDtoCopyWithImpl<$Res, AddContactDto>;
  @useResult
  $Res call({String fullName, String email});
}

/// @nodoc
class _$AddContactDtoCopyWithImpl<$Res, $Val extends AddContactDto>
    implements $AddContactDtoCopyWith<$Res> {
  _$AddContactDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddContactDtoImplCopyWith<$Res>
    implements $AddContactDtoCopyWith<$Res> {
  factory _$$AddContactDtoImplCopyWith(
          _$AddContactDtoImpl value, $Res Function(_$AddContactDtoImpl) then) =
      __$$AddContactDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fullName, String email});
}

/// @nodoc
class __$$AddContactDtoImplCopyWithImpl<$Res>
    extends _$AddContactDtoCopyWithImpl<$Res, _$AddContactDtoImpl>
    implements _$$AddContactDtoImplCopyWith<$Res> {
  __$$AddContactDtoImplCopyWithImpl(
      _$AddContactDtoImpl _value, $Res Function(_$AddContactDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = null,
  }) {
    return _then(_$AddContactDtoImpl(
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
class _$AddContactDtoImpl implements _AddContactDto {
  const _$AddContactDtoImpl({required this.fullName, required this.email});

  factory _$AddContactDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddContactDtoImplFromJson(json);

  @override
  final String fullName;
  @override
  final String email;

  @override
  String toString() {
    return 'AddContactDto(fullName: $fullName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddContactDtoImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddContactDtoImplCopyWith<_$AddContactDtoImpl> get copyWith =>
      __$$AddContactDtoImplCopyWithImpl<_$AddContactDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddContactDtoImplToJson(
      this,
    );
  }
}

abstract class _AddContactDto implements AddContactDto {
  const factory _AddContactDto(
      {required final String fullName,
      required final String email}) = _$AddContactDtoImpl;

  factory _AddContactDto.fromJson(Map<String, dynamic> json) =
      _$AddContactDtoImpl.fromJson;

  @override
  String get fullName;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$AddContactDtoImplCopyWith<_$AddContactDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserStatusDto _$UserStatusDtoFromJson(Map<String, dynamic> json) {
  return _UserStatusDto.fromJson(json);
}

/// @nodoc
mixin _$UserStatusDto {
  String get userEmail => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatusDtoCopyWith<UserStatusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatusDtoCopyWith<$Res> {
  factory $UserStatusDtoCopyWith(
          UserStatusDto value, $Res Function(UserStatusDto) then) =
      _$UserStatusDtoCopyWithImpl<$Res, UserStatusDto>;
  @useResult
  $Res call({String userEmail, String status});
}

/// @nodoc
class _$UserStatusDtoCopyWithImpl<$Res, $Val extends UserStatusDto>
    implements $UserStatusDtoCopyWith<$Res> {
  _$UserStatusDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEmail = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatusDtoImplCopyWith<$Res>
    implements $UserStatusDtoCopyWith<$Res> {
  factory _$$UserStatusDtoImplCopyWith(
          _$UserStatusDtoImpl value, $Res Function(_$UserStatusDtoImpl) then) =
      __$$UserStatusDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userEmail, String status});
}

/// @nodoc
class __$$UserStatusDtoImplCopyWithImpl<$Res>
    extends _$UserStatusDtoCopyWithImpl<$Res, _$UserStatusDtoImpl>
    implements _$$UserStatusDtoImplCopyWith<$Res> {
  __$$UserStatusDtoImplCopyWithImpl(
      _$UserStatusDtoImpl _value, $Res Function(_$UserStatusDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEmail = null,
    Object? status = null,
  }) {
    return _then(_$UserStatusDtoImpl(
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatusDtoImpl implements _UserStatusDto {
  const _$UserStatusDtoImpl({required this.userEmail, required this.status});

  factory _$UserStatusDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatusDtoImplFromJson(json);

  @override
  final String userEmail;
  @override
  final String status;

  @override
  String toString() {
    return 'UserStatusDto(userEmail: $userEmail, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatusDtoImpl &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userEmail, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatusDtoImplCopyWith<_$UserStatusDtoImpl> get copyWith =>
      __$$UserStatusDtoImplCopyWithImpl<_$UserStatusDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatusDtoImplToJson(
      this,
    );
  }
}

abstract class _UserStatusDto implements UserStatusDto {
  const factory _UserStatusDto(
      {required final String userEmail,
      required final String status}) = _$UserStatusDtoImpl;

  factory _UserStatusDto.fromJson(Map<String, dynamic> json) =
      _$UserStatusDtoImpl.fromJson;

  @override
  String get userEmail;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$UserStatusDtoImplCopyWith<_$UserStatusDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
