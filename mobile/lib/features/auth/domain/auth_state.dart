import 'package:blizz_chat/features/core/domain/user_model.dart';

sealed class AuthState {
  const AuthState();
}

class Unknown extends AuthState {
  const Unknown();
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}

class Authenticated extends AuthState {
  const Authenticated({required this.user});
  final User user;
}
