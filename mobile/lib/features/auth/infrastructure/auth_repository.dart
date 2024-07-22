import 'dart:convert';

import 'package:blizz_chat/features/auth/domain/sign_in_form.dart';
import 'package:blizz_chat/features/auth/domain/sign_up_form.dart';
import 'package:blizz_chat/features/auth/domain/base_auth_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:blizz_chat/features/core/infrastructure/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository() : super();

  @override
  Future<User> fetchUserFromToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt_token');

      final response =
          await Api().get(endpoint: 'users/fetchUser', token: token);
      final decodedBody = json.decode(response.body);
      return User.fromJson(decodedBody);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<bool> signUp({required SignUpForm signUpForm}) async {
    try {
      final response = await Api().post(endpoint: 'users/signUp', body: {
        'email': signUpForm.email,
        'password': signUpForm.password,
        'fullName': signUpForm.name
      });
      final decodedBody = json.decode(response.body) as bool;
      return decodedBody;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<User> signIn({required SignInForm signInForm}) async {
    try {
      final response = await Api().post(endpoint: 'users/signIn', body: {
        'email': signInForm.email,
        'password': signInForm.password,
      });
      final decodedBody = json.decode(response.body);
      print(response.body);
      return User.fromJson(decodedBody);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  User? getLoggedInUser() {
    return null;
  }

  @override
  Future<User?> getUserById(String id) async {
    try {
      // DocumentSnapshot userSnapshot = await userCollection.doc(id).get();
      // final userMap = userSnapshot.data() as Map<String, dynamic>;
      // User userObj = User.fromJson(userMap);
      // print(userObj.fullName);
      // print(userObj.contacts[0]);
      // return null;
      // return userObj;
      // return user.data() as User;
      final response = await Api().get(endpoint: 'users/$id');
      final decodedBody = json.decode(response.body);
      print(response.body);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  getUserStream() {
    return null;
  }

  @override
  logOut() async {}
}
