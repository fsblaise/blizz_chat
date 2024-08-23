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
  List<CreateParticipantDto> get participants =>
      throw _privateConstructorUsedError;

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
  $Res call({List<CreateParticipantDto> participants});
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
    Object? participants = null,
  }) {
    return _then(_value.copyWith(
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<CreateParticipantDto>,
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
  $Res call({List<CreateParticipantDto> participants});
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
    Object? participants = null,
  }) {
    return _then(_$CreateChatDtoImpl(
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<CreateParticipantDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateChatDtoImpl implements _CreateChatDto {
  const _$CreateChatDtoImpl(
      {required final List<CreateParticipantDto> participants})
      : _participants = participants;

  factory _$CreateChatDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateChatDtoImplFromJson(json);

  final List<CreateParticipantDto> _participants;
  @override
  List<CreateParticipantDto> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'CreateChatDto(participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateChatDtoImpl &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_participants));

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
          {required final List<CreateParticipantDto> participants}) =
      _$CreateChatDtoImpl;

  factory _CreateChatDto.fromJson(Map<String, dynamic> json) =
      _$CreateChatDtoImpl.fromJson;

  @override
  List<CreateParticipantDto> get participants;
  @override
  @JsonKey(ignore: true)
  _$$CreateChatDtoImplCopyWith<_$CreateChatDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateParticipantDto _$CreateParticipantDtoFromJson(Map<String, dynamic> json) {
  return _CreateParticipantDto.fromJson(json);
}

/// @nodoc
mixin _$CreateParticipantDto {
  CreateUserDto get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateParticipantDtoCopyWith<CreateParticipantDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateParticipantDtoCopyWith<$Res> {
  factory $CreateParticipantDtoCopyWith(CreateParticipantDto value,
          $Res Function(CreateParticipantDto) then) =
      _$CreateParticipantDtoCopyWithImpl<$Res, CreateParticipantDto>;
  @useResult
  $Res call({CreateUserDto user});

  $CreateUserDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$CreateParticipantDtoCopyWithImpl<$Res,
        $Val extends CreateParticipantDto>
    implements $CreateParticipantDtoCopyWith<$Res> {
  _$CreateParticipantDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CreateUserDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CreateUserDtoCopyWith<$Res> get user {
    return $CreateUserDtoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateParticipantDtoImplCopyWith<$Res>
    implements $CreateParticipantDtoCopyWith<$Res> {
  factory _$$CreateParticipantDtoImplCopyWith(_$CreateParticipantDtoImpl value,
          $Res Function(_$CreateParticipantDtoImpl) then) =
      __$$CreateParticipantDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CreateUserDto user});

  @override
  $CreateUserDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$$CreateParticipantDtoImplCopyWithImpl<$Res>
    extends _$CreateParticipantDtoCopyWithImpl<$Res, _$CreateParticipantDtoImpl>
    implements _$$CreateParticipantDtoImplCopyWith<$Res> {
  __$$CreateParticipantDtoImplCopyWithImpl(_$CreateParticipantDtoImpl _value,
      $Res Function(_$CreateParticipantDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$CreateParticipantDtoImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CreateUserDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateParticipantDtoImpl implements _CreateParticipantDto {
  const _$CreateParticipantDtoImpl({required this.user});

  factory _$CreateParticipantDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateParticipantDtoImplFromJson(json);

  @override
  final CreateUserDto user;

  @override
  String toString() {
    return 'CreateParticipantDto(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateParticipantDtoImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateParticipantDtoImplCopyWith<_$CreateParticipantDtoImpl>
      get copyWith =>
          __$$CreateParticipantDtoImplCopyWithImpl<_$CreateParticipantDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateParticipantDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateParticipantDto implements CreateParticipantDto {
  const factory _CreateParticipantDto({required final CreateUserDto user}) =
      _$CreateParticipantDtoImpl;

  factory _CreateParticipantDto.fromJson(Map<String, dynamic> json) =
      _$CreateParticipantDtoImpl.fromJson;

  @override
  CreateUserDto get user;
  @override
  @JsonKey(ignore: true)
  _$$CreateParticipantDtoImplCopyWith<_$CreateParticipantDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateUserDto _$CreateUserDtoFromJson(Map<String, dynamic> json) {
  return _CreateUserDto.fromJson(json);
}

/// @nodoc
mixin _$CreateUserDto {
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateUserDtoCopyWith<CreateUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserDtoCopyWith<$Res> {
  factory $CreateUserDtoCopyWith(
          CreateUserDto value, $Res Function(CreateUserDto) then) =
      _$CreateUserDtoCopyWithImpl<$Res, CreateUserDto>;
  @useResult
  $Res call({String fullName, String email});
}

/// @nodoc
class _$CreateUserDtoCopyWithImpl<$Res, $Val extends CreateUserDto>
    implements $CreateUserDtoCopyWith<$Res> {
  _$CreateUserDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$CreateUserDtoImplCopyWith<$Res>
    implements $CreateUserDtoCopyWith<$Res> {
  factory _$$CreateUserDtoImplCopyWith(
          _$CreateUserDtoImpl value, $Res Function(_$CreateUserDtoImpl) then) =
      __$$CreateUserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fullName, String email});
}

/// @nodoc
class __$$CreateUserDtoImplCopyWithImpl<$Res>
    extends _$CreateUserDtoCopyWithImpl<$Res, _$CreateUserDtoImpl>
    implements _$$CreateUserDtoImplCopyWith<$Res> {
  __$$CreateUserDtoImplCopyWithImpl(
      _$CreateUserDtoImpl _value, $Res Function(_$CreateUserDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = null,
  }) {
    return _then(_$CreateUserDtoImpl(
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
class _$CreateUserDtoImpl implements _CreateUserDto {
  const _$CreateUserDtoImpl({required this.fullName, required this.email});

  factory _$CreateUserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateUserDtoImplFromJson(json);

  @override
  final String fullName;
  @override
  final String email;

  @override
  String toString() {
    return 'CreateUserDto(fullName: $fullName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserDtoImpl &&
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
  _$$CreateUserDtoImplCopyWith<_$CreateUserDtoImpl> get copyWith =>
      __$$CreateUserDtoImplCopyWithImpl<_$CreateUserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateUserDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateUserDto implements CreateUserDto {
  const factory _CreateUserDto(
      {required final String fullName,
      required final String email}) = _$CreateUserDtoImpl;

  factory _CreateUserDto.fromJson(Map<String, dynamic> json) =
      _$CreateUserDtoImpl.fromJson;

  @override
  String get fullName;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$CreateUserDtoImplCopyWith<_$CreateUserDtoImpl> get copyWith =>
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
