part of 'users_cubit.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = UsersInitial;
  const factory UsersState.fetching() = UsersFetching;
  const factory UsersState.fetched({
    required List<User> users,
    required List<User> contacts,
  }) = UsersFetched;
  const factory UsersState.error({
    required String message,
  }) = UsersError;
}
