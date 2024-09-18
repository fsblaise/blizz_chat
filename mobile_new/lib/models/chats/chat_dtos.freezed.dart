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

ChatDto _$ChatDtoFromJson(Map<String, dynamic> json) {
  return _ChatDto.fromJson(json);
}

/// @nodoc
mixin _$ChatDto {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  List<ParticipantDto> get participants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatDtoCopyWith<ChatDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDtoCopyWith<$Res> {
  factory $ChatDtoCopyWith(ChatDto value, $Res Function(ChatDto) then) =
      _$ChatDtoCopyWithImpl<$Res, ChatDto>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String title,
      String? lastMessage,
      List<ParticipantDto> participants});
}

/// @nodoc
class _$ChatDtoCopyWithImpl<$Res, $Val extends ChatDto>
    implements $ChatDtoCopyWith<$Res> {
  _$ChatDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? lastMessage = freezed,
    Object? participants = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ParticipantDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatDtoImplCopyWith<$Res> implements $ChatDtoCopyWith<$Res> {
  factory _$$ChatDtoImplCopyWith(
          _$ChatDtoImpl value, $Res Function(_$ChatDtoImpl) then) =
      __$$ChatDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String title,
      String? lastMessage,
      List<ParticipantDto> participants});
}

/// @nodoc
class __$$ChatDtoImplCopyWithImpl<$Res>
    extends _$ChatDtoCopyWithImpl<$Res, _$ChatDtoImpl>
    implements _$$ChatDtoImplCopyWith<$Res> {
  __$$ChatDtoImplCopyWithImpl(
      _$ChatDtoImpl _value, $Res Function(_$ChatDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? lastMessage = freezed,
    Object? participants = null,
  }) {
    return _then(_$ChatDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ParticipantDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatDtoImpl implements _ChatDto {
  const _$ChatDtoImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.title,
      required this.lastMessage,
      required final List<ParticipantDto> participants})
      : _participants = participants;

  factory _$ChatDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatDtoImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String title;
  @override
  final String? lastMessage;
  final List<ParticipantDto> _participants;
  @override
  List<ParticipantDto> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'ChatDto(id: $id, title: $title, lastMessage: $lastMessage, participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, lastMessage,
      const DeepCollectionEquality().hash(_participants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatDtoImplCopyWith<_$ChatDtoImpl> get copyWith =>
      __$$ChatDtoImplCopyWithImpl<_$ChatDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatDtoImplToJson(
      this,
    );
  }
}

abstract class _ChatDto implements ChatDto {
  const factory _ChatDto(
      {@JsonKey(name: '_id') required final String id,
      required final String title,
      required final String? lastMessage,
      required final List<ParticipantDto> participants}) = _$ChatDtoImpl;

  factory _ChatDto.fromJson(Map<String, dynamic> json) = _$ChatDtoImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get title;
  @override
  String? get lastMessage;
  @override
  List<ParticipantDto> get participants;
  @override
  @JsonKey(ignore: true)
  _$$ChatDtoImplCopyWith<_$ChatDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParticipantDto _$ParticipantDtoFromJson(Map<String, dynamic> json) {
  return _ParticipantDto.fromJson(json);
}

/// @nodoc
mixin _$ParticipantDto {
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipantDtoCopyWith<ParticipantDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantDtoCopyWith<$Res> {
  factory $ParticipantDtoCopyWith(
          ParticipantDto value, $Res Function(ParticipantDto) then) =
      _$ParticipantDtoCopyWithImpl<$Res, ParticipantDto>;
  @useResult
  $Res call({String email, String fullName, String nickname});
}

/// @nodoc
class _$ParticipantDtoCopyWithImpl<$Res, $Val extends ParticipantDto>
    implements $ParticipantDtoCopyWith<$Res> {
  _$ParticipantDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? fullName = null,
    Object? nickname = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParticipantDtoImplCopyWith<$Res>
    implements $ParticipantDtoCopyWith<$Res> {
  factory _$$ParticipantDtoImplCopyWith(_$ParticipantDtoImpl value,
          $Res Function(_$ParticipantDtoImpl) then) =
      __$$ParticipantDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String fullName, String nickname});
}

/// @nodoc
class __$$ParticipantDtoImplCopyWithImpl<$Res>
    extends _$ParticipantDtoCopyWithImpl<$Res, _$ParticipantDtoImpl>
    implements _$$ParticipantDtoImplCopyWith<$Res> {
  __$$ParticipantDtoImplCopyWithImpl(
      _$ParticipantDtoImpl _value, $Res Function(_$ParticipantDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? fullName = null,
    Object? nickname = null,
  }) {
    return _then(_$ParticipantDtoImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantDtoImpl implements _ParticipantDto {
  const _$ParticipantDtoImpl(
      {required this.email, required this.fullName, required this.nickname});

  factory _$ParticipantDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipantDtoImplFromJson(json);

  @override
  final String email;
  @override
  final String fullName;
  @override
  final String nickname;

  @override
  String toString() {
    return 'ParticipantDto(email: $email, fullName: $fullName, nickname: $nickname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantDtoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, fullName, nickname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantDtoImplCopyWith<_$ParticipantDtoImpl> get copyWith =>
      __$$ParticipantDtoImplCopyWithImpl<_$ParticipantDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantDtoImplToJson(
      this,
    );
  }
}

abstract class _ParticipantDto implements ParticipantDto {
  const factory _ParticipantDto(
      {required final String email,
      required final String fullName,
      required final String nickname}) = _$ParticipantDtoImpl;

  factory _ParticipantDto.fromJson(Map<String, dynamic> json) =
      _$ParticipantDtoImpl.fromJson;

  @override
  String get email;
  @override
  String get fullName;
  @override
  String get nickname;
  @override
  @JsonKey(ignore: true)
  _$$ParticipantDtoImplCopyWith<_$ParticipantDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

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
  $Res call({String fullName, String email});
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
abstract class _$$CreateParticipantDtoImplCopyWith<$Res>
    implements $CreateParticipantDtoCopyWith<$Res> {
  factory _$$CreateParticipantDtoImplCopyWith(_$CreateParticipantDtoImpl value,
          $Res Function(_$CreateParticipantDtoImpl) then) =
      __$$CreateParticipantDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fullName, String email});
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
    Object? fullName = null,
    Object? email = null,
  }) {
    return _then(_$CreateParticipantDtoImpl(
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
class _$CreateParticipantDtoImpl implements _CreateParticipantDto {
  const _$CreateParticipantDtoImpl(
      {required this.fullName, required this.email});

  factory _$CreateParticipantDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateParticipantDtoImplFromJson(json);

  @override
  final String fullName;
  @override
  final String email;

  @override
  String toString() {
    return 'CreateParticipantDto(fullName: $fullName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateParticipantDtoImpl &&
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
  const factory _CreateParticipantDto(
      {required final String fullName,
      required final String email}) = _$CreateParticipantDtoImpl;

  factory _CreateParticipantDto.fromJson(Map<String, dynamic> json) =
      _$CreateParticipantDtoImpl.fromJson;

  @override
  String get fullName;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$CreateParticipantDtoImplCopyWith<_$CreateParticipantDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
