part of '../repositories.dart';

class AuthRepository extends RepositoryInterface<AuthService> {
  factory AuthRepository() {
    return _singleton;
  }
  AuthRepository._internal();

  static final AuthRepository _singleton = AuthRepository._internal();

  static Future<dynamic> signUp(SignUpDto body) async {
    final response = await _singleton.service.signUp(body);
    // TODO: decode response
  }

  static Future<dynamic> signIn(SignInDto body) async {
    final response = await _singleton.service.signIn(body);
    // TODO: decode response
  }
}
