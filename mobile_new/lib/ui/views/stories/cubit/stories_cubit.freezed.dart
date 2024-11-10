// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stories_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoriesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Story> stories) fetched,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Story> stories)? fetched,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Story> stories)? fetched,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoriesInitial value) initial,
    required TResult Function(StoriesFetching value) fetching,
    required TResult Function(StoriesFetched value) fetched,
    required TResult Function(StoriesError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesInitial value)? initial,
    TResult? Function(StoriesFetching value)? fetching,
    TResult? Function(StoriesFetched value)? fetched,
    TResult? Function(StoriesError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesInitial value)? initial,
    TResult Function(StoriesFetching value)? fetching,
    TResult Function(StoriesFetched value)? fetched,
    TResult Function(StoriesError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoriesStateCopyWith<$Res> {
  factory $StoriesStateCopyWith(
          StoriesState value, $Res Function(StoriesState) then) =
      _$StoriesStateCopyWithImpl<$Res, StoriesState>;
}

/// @nodoc
class _$StoriesStateCopyWithImpl<$Res, $Val extends StoriesState>
    implements $StoriesStateCopyWith<$Res> {
  _$StoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StoriesInitialImplCopyWith<$Res> {
  factory _$$StoriesInitialImplCopyWith(_$StoriesInitialImpl value,
          $Res Function(_$StoriesInitialImpl) then) =
      __$$StoriesInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StoriesInitialImplCopyWithImpl<$Res>
    extends _$StoriesStateCopyWithImpl<$Res, _$StoriesInitialImpl>
    implements _$$StoriesInitialImplCopyWith<$Res> {
  __$$StoriesInitialImplCopyWithImpl(
      _$StoriesInitialImpl _value, $Res Function(_$StoriesInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StoriesInitialImpl implements StoriesInitial {
  const _$StoriesInitialImpl();

  @override
  String toString() {
    return 'StoriesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StoriesInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Story> stories) fetched,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Story> stories)? fetched,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Story> stories)? fetched,
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
    required TResult Function(StoriesInitial value) initial,
    required TResult Function(StoriesFetching value) fetching,
    required TResult Function(StoriesFetched value) fetched,
    required TResult Function(StoriesError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesInitial value)? initial,
    TResult? Function(StoriesFetching value)? fetching,
    TResult? Function(StoriesFetched value)? fetched,
    TResult? Function(StoriesError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesInitial value)? initial,
    TResult Function(StoriesFetching value)? fetching,
    TResult Function(StoriesFetched value)? fetched,
    TResult Function(StoriesError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class StoriesInitial implements StoriesState {
  const factory StoriesInitial() = _$StoriesInitialImpl;
}

/// @nodoc
abstract class _$$StoriesFetchingImplCopyWith<$Res> {
  factory _$$StoriesFetchingImplCopyWith(_$StoriesFetchingImpl value,
          $Res Function(_$StoriesFetchingImpl) then) =
      __$$StoriesFetchingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StoriesFetchingImplCopyWithImpl<$Res>
    extends _$StoriesStateCopyWithImpl<$Res, _$StoriesFetchingImpl>
    implements _$$StoriesFetchingImplCopyWith<$Res> {
  __$$StoriesFetchingImplCopyWithImpl(
      _$StoriesFetchingImpl _value, $Res Function(_$StoriesFetchingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StoriesFetchingImpl implements StoriesFetching {
  const _$StoriesFetchingImpl();

  @override
  String toString() {
    return 'StoriesState.fetching()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StoriesFetchingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Story> stories) fetched,
    required TResult Function(String message) error,
  }) {
    return fetching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Story> stories)? fetched,
    TResult? Function(String message)? error,
  }) {
    return fetching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Story> stories)? fetched,
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
    required TResult Function(StoriesInitial value) initial,
    required TResult Function(StoriesFetching value) fetching,
    required TResult Function(StoriesFetched value) fetched,
    required TResult Function(StoriesError value) error,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesInitial value)? initial,
    TResult? Function(StoriesFetching value)? fetching,
    TResult? Function(StoriesFetched value)? fetched,
    TResult? Function(StoriesError value)? error,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesInitial value)? initial,
    TResult Function(StoriesFetching value)? fetching,
    TResult Function(StoriesFetched value)? fetched,
    TResult Function(StoriesError value)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class StoriesFetching implements StoriesState {
  const factory StoriesFetching() = _$StoriesFetchingImpl;
}

/// @nodoc
abstract class _$$StoriesFetchedImplCopyWith<$Res> {
  factory _$$StoriesFetchedImplCopyWith(_$StoriesFetchedImpl value,
          $Res Function(_$StoriesFetchedImpl) then) =
      __$$StoriesFetchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Story> stories});
}

/// @nodoc
class __$$StoriesFetchedImplCopyWithImpl<$Res>
    extends _$StoriesStateCopyWithImpl<$Res, _$StoriesFetchedImpl>
    implements _$$StoriesFetchedImplCopyWith<$Res> {
  __$$StoriesFetchedImplCopyWithImpl(
      _$StoriesFetchedImpl _value, $Res Function(_$StoriesFetchedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stories = null,
  }) {
    return _then(_$StoriesFetchedImpl(
      stories: null == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<Story>,
    ));
  }
}

/// @nodoc

class _$StoriesFetchedImpl implements StoriesFetched {
  const _$StoriesFetchedImpl({required final List<Story> stories})
      : _stories = stories;

  final List<Story> _stories;
  @override
  List<Story> get stories {
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stories);
  }

  @override
  String toString() {
    return 'StoriesState.fetched(stories: $stories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoriesFetchedImpl &&
            const DeepCollectionEquality().equals(other._stories, _stories));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_stories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoriesFetchedImplCopyWith<_$StoriesFetchedImpl> get copyWith =>
      __$$StoriesFetchedImplCopyWithImpl<_$StoriesFetchedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Story> stories) fetched,
    required TResult Function(String message) error,
  }) {
    return fetched(stories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Story> stories)? fetched,
    TResult? Function(String message)? error,
  }) {
    return fetched?.call(stories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Story> stories)? fetched,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(stories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoriesInitial value) initial,
    required TResult Function(StoriesFetching value) fetching,
    required TResult Function(StoriesFetched value) fetched,
    required TResult Function(StoriesError value) error,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesInitial value)? initial,
    TResult? Function(StoriesFetching value)? fetching,
    TResult? Function(StoriesFetched value)? fetched,
    TResult? Function(StoriesError value)? error,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesInitial value)? initial,
    TResult Function(StoriesFetching value)? fetching,
    TResult Function(StoriesFetched value)? fetched,
    TResult Function(StoriesError value)? error,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class StoriesFetched implements StoriesState {
  const factory StoriesFetched({required final List<Story> stories}) =
      _$StoriesFetchedImpl;

  List<Story> get stories;
  @JsonKey(ignore: true)
  _$$StoriesFetchedImplCopyWith<_$StoriesFetchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoriesErrorImplCopyWith<$Res> {
  factory _$$StoriesErrorImplCopyWith(
          _$StoriesErrorImpl value, $Res Function(_$StoriesErrorImpl) then) =
      __$$StoriesErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$StoriesErrorImplCopyWithImpl<$Res>
    extends _$StoriesStateCopyWithImpl<$Res, _$StoriesErrorImpl>
    implements _$$StoriesErrorImplCopyWith<$Res> {
  __$$StoriesErrorImplCopyWithImpl(
      _$StoriesErrorImpl _value, $Res Function(_$StoriesErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$StoriesErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StoriesErrorImpl implements StoriesError {
  const _$StoriesErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'StoriesState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoriesErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoriesErrorImplCopyWith<_$StoriesErrorImpl> get copyWith =>
      __$$StoriesErrorImplCopyWithImpl<_$StoriesErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Story> stories) fetched,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Story> stories)? fetched,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Story> stories)? fetched,
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
    required TResult Function(StoriesInitial value) initial,
    required TResult Function(StoriesFetching value) fetching,
    required TResult Function(StoriesFetched value) fetched,
    required TResult Function(StoriesError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesInitial value)? initial,
    TResult? Function(StoriesFetching value)? fetching,
    TResult? Function(StoriesFetched value)? fetched,
    TResult? Function(StoriesError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesInitial value)? initial,
    TResult Function(StoriesFetching value)? fetching,
    TResult Function(StoriesFetched value)? fetched,
    TResult Function(StoriesError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class StoriesError implements StoriesState {
  const factory StoriesError({required final String message}) =
      _$StoriesErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$StoriesErrorImplCopyWith<_$StoriesErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
