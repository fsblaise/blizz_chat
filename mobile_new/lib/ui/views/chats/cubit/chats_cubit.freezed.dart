// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Chat> chats) fetched,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Chat> chats)? fetched,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Chat> chats)? fetched,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatsInitial value) initial,
    required TResult Function(ChatsFetching value) fetching,
    required TResult Function(ChatsFetched value) fetched,
    required TResult Function(ChatsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatsInitial value)? initial,
    TResult? Function(ChatsFetching value)? fetching,
    TResult? Function(ChatsFetched value)? fetched,
    TResult? Function(ChatsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatsInitial value)? initial,
    TResult Function(ChatsFetching value)? fetching,
    TResult Function(ChatsFetched value)? fetched,
    TResult Function(ChatsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsStateCopyWith<$Res> {
  factory $ChatsStateCopyWith(
          ChatsState value, $Res Function(ChatsState) then) =
      _$ChatsStateCopyWithImpl<$Res, ChatsState>;
}

/// @nodoc
class _$ChatsStateCopyWithImpl<$Res, $Val extends ChatsState>
    implements $ChatsStateCopyWith<$Res> {
  _$ChatsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChatsInitialImplCopyWith<$Res> {
  factory _$$ChatsInitialImplCopyWith(
          _$ChatsInitialImpl value, $Res Function(_$ChatsInitialImpl) then) =
      __$$ChatsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatsInitialImplCopyWithImpl<$Res>
    extends _$ChatsStateCopyWithImpl<$Res, _$ChatsInitialImpl>
    implements _$$ChatsInitialImplCopyWith<$Res> {
  __$$ChatsInitialImplCopyWithImpl(
      _$ChatsInitialImpl _value, $Res Function(_$ChatsInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChatsInitialImpl implements ChatsInitial {
  const _$ChatsInitialImpl();

  @override
  String toString() {
    return 'ChatsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Chat> chats) fetched,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Chat> chats)? fetched,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Chat> chats)? fetched,
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
    required TResult Function(ChatsInitial value) initial,
    required TResult Function(ChatsFetching value) fetching,
    required TResult Function(ChatsFetched value) fetched,
    required TResult Function(ChatsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatsInitial value)? initial,
    TResult? Function(ChatsFetching value)? fetching,
    TResult? Function(ChatsFetched value)? fetched,
    TResult? Function(ChatsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatsInitial value)? initial,
    TResult Function(ChatsFetching value)? fetching,
    TResult Function(ChatsFetched value)? fetched,
    TResult Function(ChatsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ChatsInitial implements ChatsState {
  const factory ChatsInitial() = _$ChatsInitialImpl;
}

/// @nodoc
abstract class _$$ChatsFetchingImplCopyWith<$Res> {
  factory _$$ChatsFetchingImplCopyWith(
          _$ChatsFetchingImpl value, $Res Function(_$ChatsFetchingImpl) then) =
      __$$ChatsFetchingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatsFetchingImplCopyWithImpl<$Res>
    extends _$ChatsStateCopyWithImpl<$Res, _$ChatsFetchingImpl>
    implements _$$ChatsFetchingImplCopyWith<$Res> {
  __$$ChatsFetchingImplCopyWithImpl(
      _$ChatsFetchingImpl _value, $Res Function(_$ChatsFetchingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChatsFetchingImpl implements ChatsFetching {
  const _$ChatsFetchingImpl();

  @override
  String toString() {
    return 'ChatsState.fetching()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatsFetchingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Chat> chats) fetched,
    required TResult Function(String message) error,
  }) {
    return fetching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Chat> chats)? fetched,
    TResult? Function(String message)? error,
  }) {
    return fetching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Chat> chats)? fetched,
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
    required TResult Function(ChatsInitial value) initial,
    required TResult Function(ChatsFetching value) fetching,
    required TResult Function(ChatsFetched value) fetched,
    required TResult Function(ChatsError value) error,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatsInitial value)? initial,
    TResult? Function(ChatsFetching value)? fetching,
    TResult? Function(ChatsFetched value)? fetched,
    TResult? Function(ChatsError value)? error,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatsInitial value)? initial,
    TResult Function(ChatsFetching value)? fetching,
    TResult Function(ChatsFetched value)? fetched,
    TResult Function(ChatsError value)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class ChatsFetching implements ChatsState {
  const factory ChatsFetching() = _$ChatsFetchingImpl;
}

/// @nodoc
abstract class _$$ChatsFetchedImplCopyWith<$Res> {
  factory _$$ChatsFetchedImplCopyWith(
          _$ChatsFetchedImpl value, $Res Function(_$ChatsFetchedImpl) then) =
      __$$ChatsFetchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Chat> chats});
}

/// @nodoc
class __$$ChatsFetchedImplCopyWithImpl<$Res>
    extends _$ChatsStateCopyWithImpl<$Res, _$ChatsFetchedImpl>
    implements _$$ChatsFetchedImplCopyWith<$Res> {
  __$$ChatsFetchedImplCopyWithImpl(
      _$ChatsFetchedImpl _value, $Res Function(_$ChatsFetchedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
  }) {
    return _then(_$ChatsFetchedImpl(
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
    ));
  }
}

/// @nodoc

class _$ChatsFetchedImpl implements ChatsFetched {
  const _$ChatsFetchedImpl({required final List<Chat> chats}) : _chats = chats;

  final List<Chat> _chats;
  @override
  List<Chat> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  String toString() {
    return 'ChatsState.fetched(chats: $chats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsFetchedImpl &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsFetchedImplCopyWith<_$ChatsFetchedImpl> get copyWith =>
      __$$ChatsFetchedImplCopyWithImpl<_$ChatsFetchedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Chat> chats) fetched,
    required TResult Function(String message) error,
  }) {
    return fetched(chats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Chat> chats)? fetched,
    TResult? Function(String message)? error,
  }) {
    return fetched?.call(chats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Chat> chats)? fetched,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(chats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatsInitial value) initial,
    required TResult Function(ChatsFetching value) fetching,
    required TResult Function(ChatsFetched value) fetched,
    required TResult Function(ChatsError value) error,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatsInitial value)? initial,
    TResult? Function(ChatsFetching value)? fetching,
    TResult? Function(ChatsFetched value)? fetched,
    TResult? Function(ChatsError value)? error,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatsInitial value)? initial,
    TResult Function(ChatsFetching value)? fetching,
    TResult Function(ChatsFetched value)? fetched,
    TResult Function(ChatsError value)? error,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class ChatsFetched implements ChatsState {
  const factory ChatsFetched({required final List<Chat> chats}) =
      _$ChatsFetchedImpl;

  List<Chat> get chats;
  @JsonKey(ignore: true)
  _$$ChatsFetchedImplCopyWith<_$ChatsFetchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatsErrorImplCopyWith<$Res> {
  factory _$$ChatsErrorImplCopyWith(
          _$ChatsErrorImpl value, $Res Function(_$ChatsErrorImpl) then) =
      __$$ChatsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ChatsErrorImplCopyWithImpl<$Res>
    extends _$ChatsStateCopyWithImpl<$Res, _$ChatsErrorImpl>
    implements _$$ChatsErrorImplCopyWith<$Res> {
  __$$ChatsErrorImplCopyWithImpl(
      _$ChatsErrorImpl _value, $Res Function(_$ChatsErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ChatsErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatsErrorImpl implements ChatsError {
  const _$ChatsErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ChatsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsErrorImplCopyWith<_$ChatsErrorImpl> get copyWith =>
      __$$ChatsErrorImplCopyWithImpl<_$ChatsErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Chat> chats) fetched,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Chat> chats)? fetched,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Chat> chats)? fetched,
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
    required TResult Function(ChatsInitial value) initial,
    required TResult Function(ChatsFetching value) fetching,
    required TResult Function(ChatsFetched value) fetched,
    required TResult Function(ChatsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatsInitial value)? initial,
    TResult? Function(ChatsFetching value)? fetching,
    TResult? Function(ChatsFetched value)? fetched,
    TResult? Function(ChatsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatsInitial value)? initial,
    TResult Function(ChatsFetching value)? fetching,
    TResult Function(ChatsFetched value)? fetched,
    TResult Function(ChatsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChatsError implements ChatsState {
  const factory ChatsError({required final String message}) = _$ChatsErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ChatsErrorImplCopyWith<_$ChatsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
