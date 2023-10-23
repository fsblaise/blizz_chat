import 'package:blizz_chat/features/auth/domain/sign_up_form.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';

abstract class SignUpRepository {
  Future<FbUser> signUp({required SignUpForm signUpForm});
}
