import 'package:blizz_chat/features/auth/domain/sign_in_form.dart';
import 'package:blizz_chat/features/auth/domain/sign_up_form.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';

abstract class BaseAuthRepository {
  BaseAuthRepository();

  Future<User> fetchUserFromToken();
  Future<bool> signUp({required SignUpForm signUpForm});
  Future signIn({required SignInForm signInForm});
  User? getLoggedInUser();
  Future<User?> getUserById(String id);
  getUserStream();
  logOut();
}
