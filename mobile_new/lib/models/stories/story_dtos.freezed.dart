// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateStoryDto _$CreateStoryDtoFromJson(Map<String, dynamic> json) {
  return _CreateStoryDto.fromJson(json);
}

/// @nodoc
mixin _$CreateStoryDto {
  String get caption => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateStoryDtoCopyWith<CreateStoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateStoryDtoCopyWith<$Res> {
  factory $CreateStoryDtoCopyWith(
          CreateStoryDto value, $Res Function(CreateStoryDto) then) =
      _$CreateStoryDtoCopyWithImpl<$Res, CreateStoryDto>;
  @useResult
  $Res call({String caption, String email, String fullName});
}

/// @nodoc
class _$CreateStoryDtoCopyWithImpl<$Res, $Val extends CreateStoryDto>
    implements $CreateStoryDtoCopyWith<$Res> {
  _$CreateStoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caption = null,
    Object? email = null,
    Object? fullName = null,
  }) {
    return _then(_value.copyWith(
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateStoryDtoImplCopyWith<$Res>
    implements $CreateStoryDtoCopyWith<$Res> {
  factory _$$CreateStoryDtoImplCopyWith(_$CreateStoryDtoImpl value,
          $Res Function(_$CreateStoryDtoImpl) then) =
      __$$CreateStoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String caption, String email, String fullName});
}

/// @nodoc
class __$$CreateStoryDtoImplCopyWithImpl<$Res>
    extends _$CreateStoryDtoCopyWithImpl<$Res, _$CreateStoryDtoImpl>
    implements _$$CreateStoryDtoImplCopyWith<$Res> {
  __$$CreateStoryDtoImplCopyWithImpl(
      _$CreateStoryDtoImpl _value, $Res Function(_$CreateStoryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caption = null,
    Object? email = null,
    Object? fullName = null,
  }) {
    return _then(_$CreateStoryDtoImpl(
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
class _$CreateStoryDtoImpl implements _CreateStoryDto {
  const _$CreateStoryDtoImpl(
      {required this.caption, required this.email, required this.fullName});

  factory _$CreateStoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateStoryDtoImplFromJson(json);

  @override
  final String caption;
  @override
  final String email;
  @override
  final String fullName;

  @override
  String toString() {
    return 'CreateStoryDto(caption: $caption, email: $email, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateStoryDtoImpl &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, caption, email, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateStoryDtoImplCopyWith<_$CreateStoryDtoImpl> get copyWith =>
      __$$CreateStoryDtoImplCopyWithImpl<_$CreateStoryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateStoryDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateStoryDto implements CreateStoryDto {
  const factory _CreateStoryDto(
      {required final String caption,
      required final String email,
      required final String fullName}) = _$CreateStoryDtoImpl;

  factory _CreateStoryDto.fromJson(Map<String, dynamic> json) =
      _$CreateStoryDtoImpl.fromJson;

  @override
  String get caption;
  @override
  String get email;
  @override
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$CreateStoryDtoImplCopyWith<_$CreateStoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
