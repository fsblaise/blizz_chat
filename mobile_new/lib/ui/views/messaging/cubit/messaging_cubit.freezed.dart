// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messaging_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessagingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Message> messages) fetched,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Message> messages)? fetched,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Message> messages)? fetched,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessagingInitial value) initial,
    required TResult Function(MessagingFetching value) fetching,
    required TResult Function(MessagingFetched value) fetched,
    required TResult Function(MessagingError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessagingInitial value)? initial,
    TResult? Function(MessagingFetching value)? fetching,
    TResult? Function(MessagingFetched value)? fetched,
    TResult? Function(MessagingError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessagingInitial value)? initial,
    TResult Function(MessagingFetching value)? fetching,
    TResult Function(MessagingFetched value)? fetched,
    TResult Function(MessagingError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagingStateCopyWith<$Res> {
  factory $MessagingStateCopyWith(
          MessagingState value, $Res Function(MessagingState) then) =
      _$MessagingStateCopyWithImpl<$Res, MessagingState>;
}

/// @nodoc
class _$MessagingStateCopyWithImpl<$Res, $Val extends MessagingState>
    implements $MessagingStateCopyWith<$Res> {
  _$MessagingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MessagingInitialImplCopyWith<$Res> {
  factory _$$MessagingInitialImplCopyWith(_$MessagingInitialImpl value,
          $Res Function(_$MessagingInitialImpl) then) =
      __$$MessagingInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MessagingInitialImplCopyWithImpl<$Res>
    extends _$MessagingStateCopyWithImpl<$Res, _$MessagingInitialImpl>
    implements _$$MessagingInitialImplCopyWith<$Res> {
  __$$MessagingInitialImplCopyWithImpl(_$MessagingInitialImpl _value,
      $Res Function(_$MessagingInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MessagingInitialImpl implements MessagingInitial {
  const _$MessagingInitialImpl();

  @override
  String toString() {
    return 'MessagingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MessagingInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Message> messages) fetched,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Message> messages)? fetched,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Message> messages)? fetched,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessagingInitial value) initial,
    required TResult Function(MessagingFetching value) fetching,
    required TResult Function(MessagingFetched value) fetched,
    required TResult Function(MessagingError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessagingInitial value)? initial,
    TResult? Function(MessagingFetching value)? fetching,
    TResult? Function(MessagingFetched value)? fetched,
    TResult? Function(MessagingError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessagingInitial value)? initial,
    TResult Function(MessagingFetching value)? fetching,
    TResult Function(MessagingFetched value)? fetched,
    TResult Function(MessagingError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MessagingInitial implements MessagingState {
  const factory MessagingInitial() = _$MessagingInitialImpl;
}

/// @nodoc
abstract class _$$MessagingFetchingImplCopyWith<$Res> {
  factory _$$MessagingFetchingImplCopyWith(_$MessagingFetchingImpl value,
          $Res Function(_$MessagingFetchingImpl) then) =
      __$$MessagingFetchingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MessagingFetchingImplCopyWithImpl<$Res>
    extends _$MessagingStateCopyWithImpl<$Res, _$MessagingFetchingImpl>
    implements _$$MessagingFetchingImplCopyWith<$Res> {
  __$$MessagingFetchingImplCopyWithImpl(_$MessagingFetchingImpl _value,
      $Res Function(_$MessagingFetchingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MessagingFetchingImpl implements MessagingFetching {
  const _$MessagingFetchingImpl();

  @override
  String toString() {
    return 'MessagingState.fetching()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MessagingFetchingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Message> messages) fetched,
    required TResult Function(String message) error,
  }) {
    return fetching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Message> messages)? fetched,
    TResult? Function(String message)? error,
  }) {
    return fetching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Message> messages)? fetched,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessagingInitial value) initial,
    required TResult Function(MessagingFetching value) fetching,
    required TResult Function(MessagingFetched value) fetched,
    required TResult Function(MessagingError value) error,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessagingInitial value)? initial,
    TResult? Function(MessagingFetching value)? fetching,
    TResult? Function(MessagingFetched value)? fetched,
    TResult? Function(MessagingError value)? error,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessagingInitial value)? initial,
    TResult Function(MessagingFetching value)? fetching,
    TResult Function(MessagingFetched value)? fetched,
    TResult Function(MessagingError value)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class MessagingFetching implements MessagingState {
  const factory MessagingFetching() = _$MessagingFetchingImpl;
}

/// @nodoc
abstract class _$$MessagingFetchedImplCopyWith<$Res> {
  factory _$$MessagingFetchedImplCopyWith(_$MessagingFetchedImpl value,
          $Res Function(_$MessagingFetchedImpl) then) =
      __$$MessagingFetchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Message> messages});
}

/// @nodoc
class __$$MessagingFetchedImplCopyWithImpl<$Res>
    extends _$MessagingStateCopyWithImpl<$Res, _$MessagingFetchedImpl>
    implements _$$MessagingFetchedImplCopyWith<$Res> {
  __$$MessagingFetchedImplCopyWithImpl(_$MessagingFetchedImpl _value,
      $Res Function(_$MessagingFetchedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$MessagingFetchedImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$MessagingFetchedImpl implements MessagingFetched {
  const _$MessagingFetchedImpl({required final List<Message> messages})
      : _messages = messages;

  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'MessagingState.fetched(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagingFetchedImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagingFetchedImplCopyWith<_$MessagingFetchedImpl> get copyWith =>
      __$$MessagingFetchedImplCopyWithImpl<_$MessagingFetchedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Message> messages) fetched,
    required TResult Function(String message) error,
  }) {
    return fetched(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Message> messages)? fetched,
    TResult? Function(String message)? error,
  }) {
    return fetched?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Message> messages)? fetched,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessagingInitial value) initial,
    required TResult Function(MessagingFetching value) fetching,
    required TResult Function(MessagingFetched value) fetched,
    required TResult Function(MessagingError value) error,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessagingInitial value)? initial,
    TResult? Function(MessagingFetching value)? fetching,
    TResult? Function(MessagingFetched value)? fetched,
    TResult? Function(MessagingError value)? error,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessagingInitial value)? initial,
    TResult Function(MessagingFetching value)? fetching,
    TResult Function(MessagingFetched value)? fetched,
    TResult Function(MessagingError value)? error,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class MessagingFetched implements MessagingState {
  const factory MessagingFetched({required final List<Message> messages}) =
      _$MessagingFetchedImpl;

  List<Message> get messages;
  @JsonKey(ignore: true)
  _$$MessagingFetchedImplCopyWith<_$MessagingFetchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessagingErrorImplCopyWith<$Res> {
  factory _$$MessagingErrorImplCopyWith(_$MessagingErrorImpl value,
          $Res Function(_$MessagingErrorImpl) then) =
      __$$MessagingErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MessagingErrorImplCopyWithImpl<$Res>
    extends _$MessagingStateCopyWithImpl<$Res, _$MessagingErrorImpl>
    implements _$$MessagingErrorImplCopyWith<$Res> {
  __$$MessagingErrorImplCopyWithImpl(
      _$MessagingErrorImpl _value, $Res Function(_$MessagingErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MessagingErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MessagingErrorImpl implements MessagingError {
  const _$MessagingErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'MessagingState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagingErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagingErrorImplCopyWith<_$MessagingErrorImpl> get copyWith =>
      __$$MessagingErrorImplCopyWithImpl<_$MessagingErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Message> messages) fetched,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Message> messages)? fetched,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Message> messages)? fetched,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessagingInitial value) initial,
    required TResult Function(MessagingFetching value) fetching,
    required TResult Function(MessagingFetched value) fetched,
    required TResult Function(MessagingError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessagingInitial value)? initial,
    TResult? Function(MessagingFetching value)? fetching,
    TResult? Function(MessagingFetched value)? fetched,
    TResult? Function(MessagingError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessagingInitial value)? initial,
    TResult Function(MessagingFetching value)? fetching,
    TResult Function(MessagingFetched value)? fetched,
    TResult Function(MessagingError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MessagingError implements MessagingState {
  const factory MessagingError({required final String message}) =
      _$MessagingErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$MessagingErrorImplCopyWith<_$MessagingErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
