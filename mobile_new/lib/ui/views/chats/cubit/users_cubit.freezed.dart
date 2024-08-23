// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UsersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<User> users) fetched,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<User> users)? fetched,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<User> users)? fetched,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersFetching value) fetching,
    required TResult Function(UsersFetched value) fetched,
    required TResult Function(UsersError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersFetching value)? fetching,
    TResult? Function(UsersFetched value)? fetched,
    TResult? Function(UsersError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersFetching value)? fetching,
    TResult Function(UsersFetched value)? fetched,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersStateCopyWith<$Res> {
  factory $UsersStateCopyWith(
          UsersState value, $Res Function(UsersState) then) =
      _$UsersStateCopyWithImpl<$Res, UsersState>;
}

/// @nodoc
class _$UsersStateCopyWithImpl<$Res, $Val extends UsersState>
    implements $UsersStateCopyWith<$Res> {
  _$UsersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UsersInitialImplCopyWith<$Res> {
  factory _$$UsersInitialImplCopyWith(
          _$UsersInitialImpl value, $Res Function(_$UsersInitialImpl) then) =
      __$$UsersInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UsersInitialImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersInitialImpl>
    implements _$$UsersInitialImplCopyWith<$Res> {
  __$$UsersInitialImplCopyWithImpl(
      _$UsersInitialImpl _value, $Res Function(_$UsersInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UsersInitialImpl implements UsersInitial {
  const _$UsersInitialImpl();

  @override
  String toString() {
    return 'UsersState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UsersInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<User> users) fetched,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<User> users)? fetched,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<User> users)? fetched,
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
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersFetching value) fetching,
    required TResult Function(UsersFetched value) fetched,
    required TResult Function(UsersError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersFetching value)? fetching,
    TResult? Function(UsersFetched value)? fetched,
    TResult? Function(UsersError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersFetching value)? fetching,
    TResult Function(UsersFetched value)? fetched,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UsersInitial implements UsersState {
  const factory UsersInitial() = _$UsersInitialImpl;
}

/// @nodoc
abstract class _$$UsersFetchingImplCopyWith<$Res> {
  factory _$$UsersFetchingImplCopyWith(
          _$UsersFetchingImpl value, $Res Function(_$UsersFetchingImpl) then) =
      __$$UsersFetchingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UsersFetchingImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersFetchingImpl>
    implements _$$UsersFetchingImplCopyWith<$Res> {
  __$$UsersFetchingImplCopyWithImpl(
      _$UsersFetchingImpl _value, $Res Function(_$UsersFetchingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UsersFetchingImpl implements UsersFetching {
  const _$UsersFetchingImpl();

  @override
  String toString() {
    return 'UsersState.fetching()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UsersFetchingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<User> users) fetched,
    required TResult Function(String message) error,
  }) {
    return fetching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<User> users)? fetched,
    TResult? Function(String message)? error,
  }) {
    return fetching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<User> users)? fetched,
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
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersFetching value) fetching,
    required TResult Function(UsersFetched value) fetched,
    required TResult Function(UsersError value) error,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersFetching value)? fetching,
    TResult? Function(UsersFetched value)? fetched,
    TResult? Function(UsersError value)? error,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersFetching value)? fetching,
    TResult Function(UsersFetched value)? fetched,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class UsersFetching implements UsersState {
  const factory UsersFetching() = _$UsersFetchingImpl;
}

/// @nodoc
abstract class _$$UsersFetchedImplCopyWith<$Res> {
  factory _$$UsersFetchedImplCopyWith(
          _$UsersFetchedImpl value, $Res Function(_$UsersFetchedImpl) then) =
      __$$UsersFetchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<User> users});
}

/// @nodoc
class __$$UsersFetchedImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersFetchedImpl>
    implements _$$UsersFetchedImplCopyWith<$Res> {
  __$$UsersFetchedImplCopyWithImpl(
      _$UsersFetchedImpl _value, $Res Function(_$UsersFetchedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$UsersFetchedImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc

class _$UsersFetchedImpl implements UsersFetched {
  const _$UsersFetchedImpl({required final List<User> users}) : _users = users;

  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'UsersState.fetched(users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersFetchedImpl &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersFetchedImplCopyWith<_$UsersFetchedImpl> get copyWith =>
      __$$UsersFetchedImplCopyWithImpl<_$UsersFetchedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<User> users) fetched,
    required TResult Function(String message) error,
  }) {
    return fetched(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<User> users)? fetched,
    TResult? Function(String message)? error,
  }) {
    return fetched?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<User> users)? fetched,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersFetching value) fetching,
    required TResult Function(UsersFetched value) fetched,
    required TResult Function(UsersError value) error,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersFetching value)? fetching,
    TResult? Function(UsersFetched value)? fetched,
    TResult? Function(UsersError value)? error,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersFetching value)? fetching,
    TResult Function(UsersFetched value)? fetched,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class UsersFetched implements UsersState {
  const factory UsersFetched({required final List<User> users}) =
      _$UsersFetchedImpl;

  List<User> get users;
  @JsonKey(ignore: true)
  _$$UsersFetchedImplCopyWith<_$UsersFetchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UsersErrorImplCopyWith<$Res> {
  factory _$$UsersErrorImplCopyWith(
          _$UsersErrorImpl value, $Res Function(_$UsersErrorImpl) then) =
      __$$UsersErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UsersErrorImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersErrorImpl>
    implements _$$UsersErrorImplCopyWith<$Res> {
  __$$UsersErrorImplCopyWithImpl(
      _$UsersErrorImpl _value, $Res Function(_$UsersErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UsersErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UsersErrorImpl implements UsersError {
  const _$UsersErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'UsersState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersErrorImplCopyWith<_$UsersErrorImpl> get copyWith =>
      __$$UsersErrorImplCopyWithImpl<_$UsersErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<User> users) fetched,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<User> users)? fetched,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<User> users)? fetched,
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
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersFetching value) fetching,
    required TResult Function(UsersFetched value) fetched,
    required TResult Function(UsersError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersFetching value)? fetching,
    TResult? Function(UsersFetched value)? fetched,
    TResult? Function(UsersError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersFetching value)? fetching,
    TResult Function(UsersFetched value)? fetched,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UsersError implements UsersState {
  const factory UsersError({required final String message}) = _$UsersErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$UsersErrorImplCopyWith<_$UsersErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
