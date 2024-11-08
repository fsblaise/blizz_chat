// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckFormState {
  String get email => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  String? get emailError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckFormStateCopyWith<CheckFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckFormStateCopyWith<$Res> {
  factory $CheckFormStateCopyWith(
          CheckFormState value, $Res Function(CheckFormState) then) =
      _$CheckFormStateCopyWithImpl<$Res, CheckFormState>;
  @useResult
  $Res call({String email, bool isValid, String? emailError});
}

/// @nodoc
class _$CheckFormStateCopyWithImpl<$Res, $Val extends CheckFormState>
    implements $CheckFormStateCopyWith<$Res> {
  _$CheckFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? isValid = null,
    Object? emailError = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckFormStateImplCopyWith<$Res>
    implements $CheckFormStateCopyWith<$Res> {
  factory _$$CheckFormStateImplCopyWith(_$CheckFormStateImpl value,
          $Res Function(_$CheckFormStateImpl) then) =
      __$$CheckFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, bool isValid, String? emailError});
}

/// @nodoc
class __$$CheckFormStateImplCopyWithImpl<$Res>
    extends _$CheckFormStateCopyWithImpl<$Res, _$CheckFormStateImpl>
    implements _$$CheckFormStateImplCopyWith<$Res> {
  __$$CheckFormStateImplCopyWithImpl(
      _$CheckFormStateImpl _value, $Res Function(_$CheckFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? isValid = null,
    Object? emailError = freezed,
  }) {
    return _then(_$CheckFormStateImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CheckFormStateImpl
    with DiagnosticableTreeMixin
    implements _CheckFormState {
  const _$CheckFormStateImpl(
      {required this.email, required this.isValid, this.emailError});

  @override
  final String email;
  @override
  final bool isValid;
  @override
  final String? emailError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckFormState(email: $email, isValid: $isValid, emailError: $emailError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckFormState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('isValid', isValid))
      ..add(DiagnosticsProperty('emailError', emailError));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckFormStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, isValid, emailError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckFormStateImplCopyWith<_$CheckFormStateImpl> get copyWith =>
      __$$CheckFormStateImplCopyWithImpl<_$CheckFormStateImpl>(
          this, _$identity);
}

abstract class _CheckFormState implements CheckFormState {
  const factory _CheckFormState(
      {required final String email,
      required final bool isValid,
      final String? emailError}) = _$CheckFormStateImpl;

  @override
  String get email;
  @override
  bool get isValid;
  @override
  String? get emailError;
  @override
  @JsonKey(ignore: true)
  _$$CheckFormStateImplCopyWith<_$CheckFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
