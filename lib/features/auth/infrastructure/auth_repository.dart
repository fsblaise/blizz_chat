import 'dart:convert';

import 'package:blizz_chat/features/auth/domain/sign_in_form.dart';
import 'package:blizz_chat/features/auth/domain/sign_up_form.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  AuthRepository(this._auth, this._fStore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _fStore;

  Future<FbUser?> signUp({required SignUpForm signUpForm}) async {
    try {
      UserCredential authUser =
          await _auth.createUserWithEmailAndPassword(email: signUpForm.email, password: signUpForm.password);
      FbUser user =
          FbUser(signUpForm.email, DateTime.now().toIso8601String(), signUpForm.name, (authUser.user?.uid).toString());
      Map<String, dynamic> jsonUser = user.toJson();
      await _fStore.collection('Users').doc(user.id).set(jsonUser);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future signIn({required SignInForm signInForm}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: signInForm.email, password: signInForm.password);
    } catch (e) {
      rethrow;
    }
  }

  User? getLoggedInUser() {
    return _auth.currentUser;
  }

  Future<FbUser?> getUserById(String id) async {
    try {
      DocumentSnapshot userSnapshot = await _fStore.collection('Users').doc(id).get();
      final userMap = userSnapshot.data() as Map<String, dynamic>;
      FbUser userObj = FbUser.fromJson(userMap);
      print(userObj.fullName);
      return null;
      // return user.data() as FbUser;
    } catch (e) {
      rethrow;
    }
  }

  userStream() {
    return _auth.userChanges();
  }

  logOut() async {
    await _auth.signOut();
  }
}
