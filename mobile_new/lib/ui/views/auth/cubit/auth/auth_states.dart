part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.fetching() = Fetching;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  const factory AuthState.authenticated({
    required UserSession userSession,
  }) = AuthAuthenticated;
}
