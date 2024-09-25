// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'libsignal_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShareKeysDto _$ShareKeysDtoFromJson(Map<String, dynamic> json) {
  return _ShareKeysDto.fromJson(json);
}

/// @nodoc
mixin _$ShareKeysDto {
  int get regId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  Uint8List get identityPublicKey => throw _privateConstructorUsedError;
  List<int> get preKeyIds => throw _privateConstructorUsedError;
  @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
  List<Uint8List> get preKeys => throw _privateConstructorUsedError;
  int get signedId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  Uint8List get signedPublicKey => throw _privateConstructorUsedError;
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  Uint8List get signedKeySignature => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShareKeysDtoCopyWith<ShareKeysDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareKeysDtoCopyWith<$Res> {
  factory $ShareKeysDtoCopyWith(
          ShareKeysDto value, $Res Function(ShareKeysDto) then) =
      _$ShareKeysDtoCopyWithImpl<$Res, ShareKeysDto>;
  @useResult
  $Res call(
      {int regId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      Uint8List identityPublicKey,
      List<int> preKeyIds,
      @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
      List<Uint8List> preKeys,
      int signedId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      Uint8List signedPublicKey,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      Uint8List signedKeySignature});
}

/// @nodoc
class _$ShareKeysDtoCopyWithImpl<$Res, $Val extends ShareKeysDto>
    implements $ShareKeysDtoCopyWith<$Res> {
  _$ShareKeysDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regId = null,
    Object? identityPublicKey = null,
    Object? preKeyIds = null,
    Object? preKeys = null,
    Object? signedId = null,
    Object? signedPublicKey = null,
    Object? signedKeySignature = null,
  }) {
    return _then(_value.copyWith(
      regId: null == regId
          ? _value.regId
          : regId // ignore: cast_nullable_to_non_nullable
              as int,
      identityPublicKey: null == identityPublicKey
          ? _value.identityPublicKey
          : identityPublicKey // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      preKeyIds: null == preKeyIds
          ? _value.preKeyIds
          : preKeyIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      preKeys: null == preKeys
          ? _value.preKeys
          : preKeys // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>,
      signedId: null == signedId
          ? _value.signedId
          : signedId // ignore: cast_nullable_to_non_nullable
              as int,
      signedPublicKey: null == signedPublicKey
          ? _value.signedPublicKey
          : signedPublicKey // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      signedKeySignature: null == signedKeySignature
          ? _value.signedKeySignature
          : signedKeySignature // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShareKeysDtoImplCopyWith<$Res>
    implements $ShareKeysDtoCopyWith<$Res> {
  factory _$$ShareKeysDtoImplCopyWith(
          _$ShareKeysDtoImpl value, $Res Function(_$ShareKeysDtoImpl) then) =
      __$$ShareKeysDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int regId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      Uint8List identityPublicKey,
      List<int> preKeyIds,
      @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
      List<Uint8List> preKeys,
      int signedId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      Uint8List signedPublicKey,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      Uint8List signedKeySignature});
}

/// @nodoc
class __$$ShareKeysDtoImplCopyWithImpl<$Res>
    extends _$ShareKeysDtoCopyWithImpl<$Res, _$ShareKeysDtoImpl>
    implements _$$ShareKeysDtoImplCopyWith<$Res> {
  __$$ShareKeysDtoImplCopyWithImpl(
      _$ShareKeysDtoImpl _value, $Res Function(_$ShareKeysDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regId = null,
    Object? identityPublicKey = null,
    Object? preKeyIds = null,
    Object? preKeys = null,
    Object? signedId = null,
    Object? signedPublicKey = null,
    Object? signedKeySignature = null,
  }) {
    return _then(_$ShareKeysDtoImpl(
      regId: null == regId
          ? _value.regId
          : regId // ignore: cast_nullable_to_non_nullable
              as int,
      identityPublicKey: null == identityPublicKey
          ? _value.identityPublicKey
          : identityPublicKey // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      preKeyIds: null == preKeyIds
          ? _value._preKeyIds
          : preKeyIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      preKeys: null == preKeys
          ? _value._preKeys
          : preKeys // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>,
      signedId: null == signedId
          ? _value.signedId
          : signedId // ignore: cast_nullable_to_non_nullable
              as int,
      signedPublicKey: null == signedPublicKey
          ? _value.signedPublicKey
          : signedPublicKey // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      signedKeySignature: null == signedKeySignature
          ? _value.signedKeySignature
          : signedKeySignature // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShareKeysDtoImpl implements _ShareKeysDto {
  const _$ShareKeysDtoImpl(
      {required this.regId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      required this.identityPublicKey,
      required final List<int> preKeyIds,
      @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
      required final List<Uint8List> preKeys,
      required this.signedId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      required this.signedPublicKey,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      required this.signedKeySignature})
      : _preKeyIds = preKeyIds,
        _preKeys = preKeys;

  factory _$ShareKeysDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShareKeysDtoImplFromJson(json);

  @override
  final int regId;
  @override
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  final Uint8List identityPublicKey;
  final List<int> _preKeyIds;
  @override
  List<int> get preKeyIds {
    if (_preKeyIds is EqualUnmodifiableListView) return _preKeyIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preKeyIds);
  }

  final List<Uint8List> _preKeys;
  @override
  @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
  List<Uint8List> get preKeys {
    if (_preKeys is EqualUnmodifiableListView) return _preKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preKeys);
  }

  @override
  final int signedId;
  @override
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  final Uint8List signedPublicKey;
  @override
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  final Uint8List signedKeySignature;

  @override
  String toString() {
    return 'ShareKeysDto(regId: $regId, identityPublicKey: $identityPublicKey, preKeyIds: $preKeyIds, preKeys: $preKeys, signedId: $signedId, signedPublicKey: $signedPublicKey, signedKeySignature: $signedKeySignature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShareKeysDtoImpl &&
            (identical(other.regId, regId) || other.regId == regId) &&
            const DeepCollectionEquality()
                .equals(other.identityPublicKey, identityPublicKey) &&
            const DeepCollectionEquality()
                .equals(other._preKeyIds, _preKeyIds) &&
            const DeepCollectionEquality().equals(other._preKeys, _preKeys) &&
            (identical(other.signedId, signedId) ||
                other.signedId == signedId) &&
            const DeepCollectionEquality()
                .equals(other.signedPublicKey, signedPublicKey) &&
            const DeepCollectionEquality()
                .equals(other.signedKeySignature, signedKeySignature));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      regId,
      const DeepCollectionEquality().hash(identityPublicKey),
      const DeepCollectionEquality().hash(_preKeyIds),
      const DeepCollectionEquality().hash(_preKeys),
      signedId,
      const DeepCollectionEquality().hash(signedPublicKey),
      const DeepCollectionEquality().hash(signedKeySignature));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShareKeysDtoImplCopyWith<_$ShareKeysDtoImpl> get copyWith =>
      __$$ShareKeysDtoImplCopyWithImpl<_$ShareKeysDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShareKeysDtoImplToJson(
      this,
    );
  }
}

abstract class _ShareKeysDto implements ShareKeysDto {
  const factory _ShareKeysDto(
      {required final int regId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      required final Uint8List identityPublicKey,
      required final List<int> preKeyIds,
      @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
      required final List<Uint8List> preKeys,
      required final int signedId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      required final Uint8List signedPublicKey,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      required final Uint8List signedKeySignature}) = _$ShareKeysDtoImpl;

  factory _ShareKeysDto.fromJson(Map<String, dynamic> json) =
      _$ShareKeysDtoImpl.fromJson;

  @override
  int get regId;
  @override
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  Uint8List get identityPublicKey;
  @override
  List<int> get preKeyIds;
  @override
  @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
  List<Uint8List> get preKeys;
  @override
  int get signedId;
  @override
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  Uint8List get signedPublicKey;
  @override
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  Uint8List get signedKeySignature;
  @override
  @JsonKey(ignore: true)
  _$$ShareKeysDtoImplCopyWith<_$ShareKeysDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KeysDto _$KeysDtoFromJson(Map<String, dynamic> json) {
  return _KeysDto.fromJson(json);
}

/// @nodoc
mixin _$KeysDto {
  int get regId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  Uint8List get identityPublicKey => throw _privateConstructorUsedError;
  List<int> get preKeyIds => throw _privateConstructorUsedError;
  @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
  List<Uint8List> get preKeys => throw _privateConstructorUsedError;
  int get signedId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  Uint8List get signedPublicKey => throw _privateConstructorUsedError;
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  Uint8List get signedKeySignature => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeysDtoCopyWith<KeysDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeysDtoCopyWith<$Res> {
  factory $KeysDtoCopyWith(KeysDto value, $Res Function(KeysDto) then) =
      _$KeysDtoCopyWithImpl<$Res, KeysDto>;
  @useResult
  $Res call(
      {int regId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      Uint8List identityPublicKey,
      List<int> preKeyIds,
      @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
      List<Uint8List> preKeys,
      int signedId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      Uint8List signedPublicKey,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      Uint8List signedKeySignature,
      String email});
}

/// @nodoc
class _$KeysDtoCopyWithImpl<$Res, $Val extends KeysDto>
    implements $KeysDtoCopyWith<$Res> {
  _$KeysDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regId = null,
    Object? identityPublicKey = null,
    Object? preKeyIds = null,
    Object? preKeys = null,
    Object? signedId = null,
    Object? signedPublicKey = null,
    Object? signedKeySignature = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      regId: null == regId
          ? _value.regId
          : regId // ignore: cast_nullable_to_non_nullable
              as int,
      identityPublicKey: null == identityPublicKey
          ? _value.identityPublicKey
          : identityPublicKey // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      preKeyIds: null == preKeyIds
          ? _value.preKeyIds
          : preKeyIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      preKeys: null == preKeys
          ? _value.preKeys
          : preKeys // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>,
      signedId: null == signedId
          ? _value.signedId
          : signedId // ignore: cast_nullable_to_non_nullable
              as int,
      signedPublicKey: null == signedPublicKey
          ? _value.signedPublicKey
          : signedPublicKey // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      signedKeySignature: null == signedKeySignature
          ? _value.signedKeySignature
          : signedKeySignature // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeysDtoImplCopyWith<$Res> implements $KeysDtoCopyWith<$Res> {
  factory _$$KeysDtoImplCopyWith(
          _$KeysDtoImpl value, $Res Function(_$KeysDtoImpl) then) =
      __$$KeysDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int regId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      Uint8List identityPublicKey,
      List<int> preKeyIds,
      @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
      List<Uint8List> preKeys,
      int signedId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      Uint8List signedPublicKey,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      Uint8List signedKeySignature,
      String email});
}

/// @nodoc
class __$$KeysDtoImplCopyWithImpl<$Res>
    extends _$KeysDtoCopyWithImpl<$Res, _$KeysDtoImpl>
    implements _$$KeysDtoImplCopyWith<$Res> {
  __$$KeysDtoImplCopyWithImpl(
      _$KeysDtoImpl _value, $Res Function(_$KeysDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regId = null,
    Object? identityPublicKey = null,
    Object? preKeyIds = null,
    Object? preKeys = null,
    Object? signedId = null,
    Object? signedPublicKey = null,
    Object? signedKeySignature = null,
    Object? email = null,
  }) {
    return _then(_$KeysDtoImpl(
      regId: null == regId
          ? _value.regId
          : regId // ignore: cast_nullable_to_non_nullable
              as int,
      identityPublicKey: null == identityPublicKey
          ? _value.identityPublicKey
          : identityPublicKey // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      preKeyIds: null == preKeyIds
          ? _value._preKeyIds
          : preKeyIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      preKeys: null == preKeys
          ? _value._preKeys
          : preKeys // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>,
      signedId: null == signedId
          ? _value.signedId
          : signedId // ignore: cast_nullable_to_non_nullable
              as int,
      signedPublicKey: null == signedPublicKey
          ? _value.signedPublicKey
          : signedPublicKey // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      signedKeySignature: null == signedKeySignature
          ? _value.signedKeySignature
          : signedKeySignature // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KeysDtoImpl implements _KeysDto {
  const _$KeysDtoImpl(
      {required this.regId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      required this.identityPublicKey,
      required final List<int> preKeyIds,
      @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
      required final List<Uint8List> preKeys,
      required this.signedId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      required this.signedPublicKey,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      required this.signedKeySignature,
      required this.email})
      : _preKeyIds = preKeyIds,
        _preKeys = preKeys;

  factory _$KeysDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeysDtoImplFromJson(json);

  @override
  final int regId;
  @override
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  final Uint8List identityPublicKey;
  final List<int> _preKeyIds;
  @override
  List<int> get preKeyIds {
    if (_preKeyIds is EqualUnmodifiableListView) return _preKeyIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preKeyIds);
  }

  final List<Uint8List> _preKeys;
  @override
  @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
  List<Uint8List> get preKeys {
    if (_preKeys is EqualUnmodifiableListView) return _preKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preKeys);
  }

  @override
  final int signedId;
  @override
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  final Uint8List signedPublicKey;
  @override
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  final Uint8List signedKeySignature;
  @override
  final String email;

  @override
  String toString() {
    return 'KeysDto(regId: $regId, identityPublicKey: $identityPublicKey, preKeyIds: $preKeyIds, preKeys: $preKeys, signedId: $signedId, signedPublicKey: $signedPublicKey, signedKeySignature: $signedKeySignature, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeysDtoImpl &&
            (identical(other.regId, regId) || other.regId == regId) &&
            const DeepCollectionEquality()
                .equals(other.identityPublicKey, identityPublicKey) &&
            const DeepCollectionEquality()
                .equals(other._preKeyIds, _preKeyIds) &&
            const DeepCollectionEquality().equals(other._preKeys, _preKeys) &&
            (identical(other.signedId, signedId) ||
                other.signedId == signedId) &&
            const DeepCollectionEquality()
                .equals(other.signedPublicKey, signedPublicKey) &&
            const DeepCollectionEquality()
                .equals(other.signedKeySignature, signedKeySignature) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      regId,
      const DeepCollectionEquality().hash(identityPublicKey),
      const DeepCollectionEquality().hash(_preKeyIds),
      const DeepCollectionEquality().hash(_preKeys),
      signedId,
      const DeepCollectionEquality().hash(signedPublicKey),
      const DeepCollectionEquality().hash(signedKeySignature),
      email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeysDtoImplCopyWith<_$KeysDtoImpl> get copyWith =>
      __$$KeysDtoImplCopyWithImpl<_$KeysDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeysDtoImplToJson(
      this,
    );
  }
}

abstract class _KeysDto implements KeysDto {
  const factory _KeysDto(
      {required final int regId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      required final Uint8List identityPublicKey,
      required final List<int> preKeyIds,
      @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
      required final List<Uint8List> preKeys,
      required final int signedId,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      required final Uint8List signedPublicKey,
      @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
      required final Uint8List signedKeySignature,
      required final String email}) = _$KeysDtoImpl;

  factory _KeysDto.fromJson(Map<String, dynamic> json) = _$KeysDtoImpl.fromJson;

  @override
  int get regId;
  @override
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  Uint8List get identityPublicKey;
  @override
  List<int> get preKeyIds;
  @override
  @JsonKey(fromJson: uint8ListListFromJson, toJson: uint8ListListToJson)
  List<Uint8List> get preKeys;
  @override
  int get signedId;
  @override
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  Uint8List get signedPublicKey;
  @override
  @JsonKey(fromJson: uint8ListFromJson, toJson: uint8ListToJson)
  Uint8List get signedKeySignature;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$KeysDtoImplCopyWith<_$KeysDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}