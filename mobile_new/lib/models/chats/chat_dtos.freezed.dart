// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateChatDto _$CreateChatDtoFromJson(Map<String, dynamic> json) {
  return _CreateChatDto.fromJson(json);
}

/// @nodoc
mixin _$CreateChatDto {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateChatDtoCopyWith<CreateChatDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateChatDtoCopyWith<$Res> {
  factory $CreateChatDtoCopyWith(
          CreateChatDto value, $Res Function(CreateChatDto) then) =
      _$CreateChatDtoCopyWithImpl<$Res, CreateChatDto>;
  @useResult
  $Res call({String email, String password, String fullName});
}

/// @nodoc
class _$CreateChatDtoCopyWithImpl<$Res, $Val extends CreateChatDto>
    implements $CreateChatDtoCopyWith<$Res> {
  _$CreateChatDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateChatDtoImplCopyWith<$Res>
    implements $CreateChatDtoCopyWith<$Res> {
  factory _$$CreateChatDtoImplCopyWith(
          _$CreateChatDtoImpl value, $Res Function(_$CreateChatDtoImpl) then) =
      __$$CreateChatDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String fullName});
}

/// @nodoc
class __$$CreateChatDtoImplCopyWithImpl<$Res>
    extends _$CreateChatDtoCopyWithImpl<$Res, _$CreateChatDtoImpl>
    implements _$$CreateChatDtoImplCopyWith<$Res> {
  __$$CreateChatDtoImplCopyWithImpl(
      _$CreateChatDtoImpl _value, $Res Function(_$CreateChatDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = null,
  }) {
    return _then(_$CreateChatDtoImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateChatDtoImpl implements _CreateChatDto {
  const _$CreateChatDtoImpl(
      {required this.email, required this.password, required this.fullName});

  factory _$CreateChatDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateChatDtoImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String fullName;

  @override
  String toString() {
    return 'CreateChatDto(email: $email, password: $password, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateChatDtoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateChatDtoImplCopyWith<_$CreateChatDtoImpl> get copyWith =>
      __$$CreateChatDtoImplCopyWithImpl<_$CreateChatDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateChatDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateChatDto implements CreateChatDto {
  const factory _CreateChatDto(
      {required final String email,
      required final String password,
      required final String fullName}) = _$CreateChatDtoImpl;

  factory _CreateChatDto.fromJson(Map<String, dynamic> json) =
      _$CreateChatDtoImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$CreateChatDtoImplCopyWith<_$CreateChatDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateChatDto _$UpdateChatDtoFromJson(Map<String, dynamic> json) {
  return _UpdateChatDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateChatDto {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateChatDtoCopyWith<UpdateChatDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateChatDtoCopyWith<$Res> {
  factory $UpdateChatDtoCopyWith(
          UpdateChatDto value, $Res Function(UpdateChatDto) then) =
      _$UpdateChatDtoCopyWithImpl<$Res, UpdateChatDto>;
  @useResult
  $Res call({String email, String password, String fullName});
}

/// @nodoc
class _$UpdateChatDtoCopyWithImpl<$Res, $Val extends UpdateChatDto>
    implements $UpdateChatDtoCopyWith<$Res> {
  _$UpdateChatDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateChatDtoImplCopyWith<$Res>
    implements $UpdateChatDtoCopyWith<$Res> {
  factory _$$UpdateChatDtoImplCopyWith(
          _$UpdateChatDtoImpl value, $Res Function(_$UpdateChatDtoImpl) then) =
      __$$UpdateChatDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String fullName});
}

/// @nodoc
class __$$UpdateChatDtoImplCopyWithImpl<$Res>
    extends _$UpdateChatDtoCopyWithImpl<$Res, _$UpdateChatDtoImpl>
    implements _$$UpdateChatDtoImplCopyWith<$Res> {
  __$$UpdateChatDtoImplCopyWithImpl(
      _$UpdateChatDtoImpl _value, $Res Function(_$UpdateChatDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = null,
  }) {
    return _then(_$UpdateChatDtoImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateChatDtoImpl implements _UpdateChatDto {
  const _$UpdateChatDtoImpl(
      {required this.email, required this.password, required this.fullName});

  factory _$UpdateChatDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateChatDtoImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String fullName;

  @override
  String toString() {
    return 'UpdateChatDto(email: $email, password: $password, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateChatDtoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateChatDtoImplCopyWith<_$UpdateChatDtoImpl> get copyWith =>
      __$$UpdateChatDtoImplCopyWithImpl<_$UpdateChatDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateChatDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateChatDto implements UpdateChatDto {
  const factory _UpdateChatDto(
      {required final String email,
      required final String password,
      required final String fullName}) = _$UpdateChatDtoImpl;

  factory _UpdateChatDto.fromJson(Map<String, dynamic> json) =
      _$UpdateChatDtoImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$UpdateChatDtoImplCopyWith<_$UpdateChatDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
