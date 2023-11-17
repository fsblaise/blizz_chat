import 'package:blizz_chat/features/auth/domain/sign_in_form.dart';
import 'package:blizz_chat/features/auth/domain/sign_up_form.dart';
import 'package:blizz_chat/features/core/domain/collections_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuthRepository extends CollectionsRepository {
  BaseAuthRepository(super.fStore);

  Future<FbUser?> signUp({required SignUpForm signUpForm});
  Future signIn({required SignInForm signInForm});
  User? getLoggedInUser();
  Future<FbUser?> getUserById(String id);
  getUserStream();
  logOut();
}
