import 'dart:convert';

import 'package:blizz_chat/features/auth/domain/sign_in_form.dart';
import 'package:blizz_chat/features/auth/domain/sign_up_form.dart';
import 'package:blizz_chat/features/auth/domain/base_auth_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository(this._auth, this._fStore) : super(_fStore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _fStore;

  @override
  Future<FbUser?> signUp({required SignUpForm signUpForm}) async {
    try {
      UserCredential authUser =
          await _auth.createUserWithEmailAndPassword(email: signUpForm.email, password: signUpForm.password);
      FbUser user =
          FbUser(signUpForm.email, DateTime.now().toIso8601String(), signUpForm.name, (authUser.user?.uid).toString());
      Map<String, dynamic> jsonUser = user.toJson();
      await userCollection.doc(user.id).set(jsonUser);
      return user;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future signIn({required SignInForm signInForm}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: signInForm.email, password: signInForm.password);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  User? getLoggedInUser() {
    return _auth.currentUser;
  }

  @override
  Future<FbUser?> getUserById(String id) async {
    try {
      DocumentSnapshot userSnapshot = await userCollection.doc(id).get();
      final userMap = userSnapshot.data() as Map<String, dynamic>;
      FbUser userObj = FbUser.fromJson(userMap);
      print(userObj.fullName);
      // print(userObj.contacts[0]);
      return null;
      // return userObj;
      // return user.data() as FbUser;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  getUserStream() {
    return _auth.userChanges();
  }

  @override
  logOut() async {
    await _auth.signOut();
  }
}
